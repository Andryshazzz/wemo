import '../data/models/coin_dto.dart';
import '../data/source/network/api_client.dart';

class CoinRepository {
  final ApiClient apiClient;

  CoinRepository({required this.apiClient});

  Future<List<CoinDto>> getCoin() async {
    return apiClient.getCoin();
  }
}
