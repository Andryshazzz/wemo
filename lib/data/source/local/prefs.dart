import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/coin_dto.dart';

@singleton
class Prefs {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static const String _balanceKey = 'user_balance';

  Future<void> updateCache(List<CoinDto> coins) async {
    final prefs = await _prefs;
    for (var coin in coins) {
      await prefs.setDouble('coin_price_${coin.name}', coin.price);
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
}
