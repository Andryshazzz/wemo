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
      ),
    );
  }

  Future<void> _onBuyCoin(BuyCoin event, Emitter<HomeState> emit) async {
    final cost = event.amount * event.price;
    final newBalance = state.balance - cost;
    if (newBalance < 0) {
      log('balance < 0');
    }
    await repository.setBalance(newBalance);
    emit(state.copyWith(balance: newBalance));
  }

  Future<void> _onSellCoin(SellCoin event, Emitter<HomeState> emit) async {
    final revenue = event.amount * event.price;
    final newBalance = state.balance + revenue;
    await repository.setBalance(newBalance);
    emit(state.copyWith(balance: newBalance));
  }
}
