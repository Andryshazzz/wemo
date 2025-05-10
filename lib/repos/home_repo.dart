import 'package:injectable/injectable.dart';

import '../data/models/coin.dart';
import '../data/source/local/prefs.dart';
import '../data/source/network/api_client.dart';

@singleton
class HomeRepository {
  final ApiClient apiClient;
  final Prefs prefs;

  HomeRepository({required this.apiClient, required this.prefs});

  Future<List<Coin>> getCoin(List<String> cryptoSymbols) async {
    return apiClient.getCoin(cryptoSymbols);
  }

  Future<double?> getPreviousPrice(String coinName) async {
    return prefs.getPreviousPrice(coinName);
  }

  Future<void> updateCache(List<Coin> coins) async {
    return prefs.updateCache(coins);
  }

  Future<void> setBalance(double balance) async {
    return prefs.setBalance(balance);
  }

  Future<double> getBalance() async {
    return prefs.getBalance();
  }

  Future<void> setPortfolio(Map<String, double> portfolio) async {
    return prefs.setPortfolio(portfolio);
  }

  Future<Map<String, double>> getPortfolio() async {
    return prefs.getPortfolio();
  }
}
