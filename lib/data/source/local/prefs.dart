import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/coin.dart';


@singleton
class Prefs {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static const String _balanceKey = 'user_balance';
  static const String _portfolioKey = 'user_portfolio';

  Future<void> updateCache(List<Coin> coins) async {
    final prefs = await _prefs;
    for (final coin in coins) {
      await prefs.setDouble('coin_price_${coin.name}', coin.price.toDouble());
    }
  }

  Future<double?> getPreviousPrice(String coinName) async {
    final prefs = await _prefs;
    return prefs.getDouble('coin_price_$coinName');
  }

  Future<void> clearCache() async {
    final prefs = await _prefs;
    await prefs.clear();
  }

  Future<void> setBalance(double balance) async {
    final prefs = await _prefs;
    await prefs.setDouble(_balanceKey, balance);
  }

  Future<double> getBalance() async {
    final prefs = await _prefs;
    return prefs.getDouble(_balanceKey) ?? 22312.32;
  }

  Future<void> setPortfolio(Map<String, double> portfolio) async {
    final prefs = await _prefs;
    final portfolioString = portfolio.entries
        .map((e) => '${e.key}:${e.value}')
        .join(',');
    await prefs.setString(_portfolioKey, portfolioString);
  }

  Future<Map<String, double>> getPortfolio() async {
    final prefs = await _prefs;
    final portfolioString = prefs.getString(_portfolioKey) ?? '';
    if (portfolioString.isEmpty) return {};
    return Map.fromEntries(
      portfolioString.split(',').where((e) => e.isNotEmpty).map((entry) {
        final parts = entry.split(':');
        return MapEntry(parts[0], double.parse(parts[1]));
      }),
    );
  }
}
