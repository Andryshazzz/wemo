import 'package:injectable/injectable.dart';

import '../data/models/coin_dto.dart';
import '../data/source/local/prefs.dart';
import '../data/source/network/api_client.dart';

@singleton
class CoinRepository {
  final ApiClient apiClient;
  final Prefs prefs;

  CoinRepository({required this.apiClient, required this.prefs});

  Future<List<CoinDto>> getCoin(List<String> cryptoSymbols) async {
    return apiClient.getCoin(cryptoSymbols);
  }

  Future<double?> getPreviousPrice(String coinName) async {
    return prefs.getPreviousPrice(coinName);
  }

  Future<void> updateCache(List<CoinDto> coins) async {
    return prefs.updateCache(coins);
  }

  Future<void> setBalance(double balance) async {
    return prefs.setBalance(balance);
  }

  Future<double> getBalance() async {
    return prefs.getBalance();
  }
}
