import '../../../data/models/coin_dto.dart';

class HomeState {
  final bool isLoading;
  final List<CoinDto> coins;
  final Map<String, double?> previousPrices;
  final double balance;

  HomeState({
    this.isLoading = true,
    this.coins = const [],
    this.previousPrices = const {},
    this.balance = 22312.32,
  });

  HomeState copyWith({
    bool? isLoading,
    List<CoinDto>? coins,
    Map<String, double?>? previousPrices,
    double? balance,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      coins: coins ?? this.coins,
      previousPrices: previousPrices ?? this.previousPrices,
      balance: balance ?? this.balance,
    );
  }
}
