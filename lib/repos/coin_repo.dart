import 'package:injectable/injectable.dart';

import '../data/models/coin_dto.dart';
import '../data/source/network/api_client.dart';

@singleton
class CoinRepository {
  final ApiClient apiClient;

  CoinRepository({required this.apiClient});

  Future<List<CoinDto>> getCoin(List<String> cryptoSymbols) async {
    return apiClient.getCoin(cryptoSymbols);
  }
}
