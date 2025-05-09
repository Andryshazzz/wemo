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
  }

  Future<void> _onLoadCoins(LoadCoin event, Emitter<HomeState> emit) async {
    final coins = await repository.getCoin(['BTC', 'ETH', 'TON']);
    emit(state.copyWith(isLoading: false, coins: coins));
  }
}
