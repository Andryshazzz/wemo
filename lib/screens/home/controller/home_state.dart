import '../../../data/models/coin_dto.dart';

class HomeState {
  final bool isLoading;
  final List<CoinDto> coins;

  HomeState({this.isLoading = true, this.coins = const []});

  HomeState copyWith({bool? isLoading, List<CoinDto>? coins}) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      coins: coins ?? this.coins,
    );
  }
}
