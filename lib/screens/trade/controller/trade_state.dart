import '../../../data/models/coin_dto.dart';

class TradeState {
  final bool isLoading;
  final List<CoinDto> coins;

  TradeState({this.isLoading = true, this.coins = const []});

  TradeState copyWith({bool? isLoading, List<CoinDto>? coins}) {
    return TradeState(
      isLoading: isLoading ?? this.isLoading,
      coins: coins ?? this.coins,
    );
  }
}
