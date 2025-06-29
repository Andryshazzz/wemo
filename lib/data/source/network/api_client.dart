import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../../../res/dependencies.dart';
import '../../models/coin.dart';

@singleton
class ApiClient {
  ApiClient() {
    _initDio();
  }

  final _dio = Dio();

  Future<void> _initDio() async {
    const apiUrl = 'https://min-api.cryptocompare.com';

    _dio.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
        ),
      ),
    );

    _dio.options
      ..baseUrl = apiUrl
      ..connectTimeout = const Duration(seconds: 30)
      ..receiveTimeout = const Duration(seconds: 60)
      ..sendTimeout = const Duration(seconds: 30);
  }

  Future<List<Coin>> getCoin(List<String> cryptoSymbols) async {
    try {
      final request = await _dio.get(
        '/data/pricemulti?fsyms=${cryptoSymbols.join(',')}&tsyms=USD',
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
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        if (e.response?.statusCode == 404) return [];
      } else {
        print(e);
      }
    }
    return [];
  }
}
