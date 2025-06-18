import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wemo/data/models/coin.dart';
import 'package:wemo/data/source/local/prefs.dart';
import 'package:wemo/data/source/network/api_client.dart';
import 'package:wemo/repos/home_repo.dart';

void main() {
  late ApiClientMock apiClientMock;
  late PrefsMock prefsMock;
  late HomeRepository repository;

  setUp(() {
    apiClientMock = ApiClientMock();
    prefsMock = PrefsMock();

    repository = HomeRepository(apiClient: apiClientMock, prefs: prefsMock);
  });
  group('HomeRepository', () {
    test('Testing home repository', () async {
      final coinsName = ['BTC'];
      final mockCoin = Coin(name: 'BTC', price: 1);

      when(
        () => apiClientMock.getCoin(coinsName),
      ).thenAnswer((_) async => [mockCoin]);

      final result = await repository.getCoin(coinsName);

      expect(result, isA<List<Coin>>());
      expect(result.length, 1);
      expect(result[0].name, 'BTC');
      verify(() => apiClientMock.getCoin(coinsName)).called(1);
    });
  });
}

class ApiClientMock extends Mock implements ApiClient {}

class PrefsMock extends Mock implements Prefs {}
