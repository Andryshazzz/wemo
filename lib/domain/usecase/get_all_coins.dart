import '../entity/coin.dart';
import '../repository/coin_repo.dart';

class GetAllCoins {
  GetAllCoins({required CoinRepository repository}) : _repository = repository;

  final CoinRepository _repository;

  Future<List<Coin>> getAllCoins() async {
    final list = await _repository.getCoin();
    return list;
  }
}
