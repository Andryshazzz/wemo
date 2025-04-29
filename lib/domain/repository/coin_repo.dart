import '../entity/coin.dart';

abstract class CoinRepository {
  Future<List<Coin>> getCoin();
}
