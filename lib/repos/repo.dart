import '../data/api/api_client.dart';
import '../data/coin_model.dart';

class MainRepo {
  MainRepo({required this.apiClient});

  final ApiClient apiClient;

  Future<List<Coin>> getCharacters() async {
    return apiClient.getCoin();
  }
}
