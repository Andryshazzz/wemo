import 'package:dio/dio.dart';

import '../coin_model.dart';

class ApiClient {
  ApiClient() {
    _initDio();
  }

  final _dio = Dio();

  Future<void> _initDio() async {
    const apiUrl = 'https://min-api.cryptocompare.com';

    _dio.options
      ..baseUrl = apiUrl
      ..connectTimeout = const Duration(seconds: 30)
      ..receiveTimeout = const Duration(seconds: 60)
      ..sendTimeout = const Duration(seconds: 30);
  }

  Future<List<Coin>> getCoin() async {
    final request = await _dio.get(
      '/data/pricemulti?fsyms=BTC,ETH,TON&tsyms=USD',
    );

    final data = request.data as Map<String, dynamic>;
    final coinsList =
        data.entries
            .map(
              (e) => Coin(
                name: e.key,
                price: (e.value as Map<String, dynamic>)['USD'],
              ),
            )
            .toList();
    return coinsList;
  }
}
