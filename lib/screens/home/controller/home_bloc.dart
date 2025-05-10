import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../repos/coin_repo.dart';
import 'home_event.dart';
import 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CoinRepository repository;

  HomeBloc({required this.repository}) : super(HomeState()) {
    on<LoadCoin>(_onLoadCoins);
    on<BuyCoin>(_onBuyCoin);
    on<SellCoin>(_onSellCoin);
  }

  Future<void> _onLoadCoins(LoadCoin event, Emitter<HomeState> emit) async {
    final coins = await repository.getCoin(['BTC', 'ETH', 'TON']);

    final balance = await repository.getBalance();
    final portfolio = await repository.getPortfolio();

    final previousPrices = <String, double?>{};
    for (var coin in coins) {
      previousPrices[coin.name] = await (await repository.getPreviousPrice(
        coin.name,
      ));
    }
    await repository.updateCache(coins);

    emit(
      state.copyWith(
        isLoading: false,
        coins: coins,
        previousPrices: previousPrices,
        balance: balance,
        portfolio: portfolio,
      ),
    );
  }

  Future<void> _onBuyCoin(BuyCoin event, Emitter<HomeState> emit) async {
    final cost = event.amount * event.price;
    final newBalance = state.balance - cost;
    if (newBalance < 0) {
      log('balance < 0');
      return;
    }

    final newPortfolio = Map<String, double>.from(state.portfolio);
    newPortfolio[event.coinName] =
        (newPortfolio[event.coinName] ?? 0) + event.amount;

    await repository.setBalance(newBalance);
    await repository.setPortfolio(newPortfolio);

    emit(state.copyWith(balance: newBalance, portfolio: newPortfolio));
  }

  Future<void> _onSellCoin(SellCoin event, Emitter<HomeState> emit) async {
    final currentAmount = state.portfolio[event.coinName] ?? 0;
    if (currentAmount < event.amount) {
      log('currentAmount < 0');
      return;
    }

    final revenue = event.amount * event.price;
    final newBalance = state.balance + revenue;
    final newPortfolio = Map<String, double>.from(state.portfolio);
    newPortfolio[event.coinName] = currentAmount - event.amount;
    if (newPortfolio[event.coinName] == 0) {
      newPortfolio.remove(event.coinName);
    }

    await repository.setBalance(newBalance);
    await repository.setPortfolio(newPortfolio);

    emit(state.copyWith(balance: newBalance, portfolio: newPortfolio));
  }
}
