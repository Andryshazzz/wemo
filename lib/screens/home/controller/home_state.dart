import '../../../data/models/coin_dto.dart';

class HomeState {
  final bool isLoading;
  final List<CoinDto> coins;
  final Map<String, double?> previousPrices;

  HomeState({
    this.isLoading = true,
    this.coins = const [],
    this.previousPrices = const {},
  });

  HomeState copyWith({
    bool? isLoading,
    List<CoinDto>? coins,
    Map<String, double?>? previousPrices,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      coins: coins ?? this.coins,
      previousPrices: previousPrices ?? this.previousPrices,
    );
  }
}
