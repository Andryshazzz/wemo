import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wemo/data/models/coin.dart';
import 'package:wemo/feature/home/controller/home_bloc.dart';
import 'package:wemo/feature/home/controller/home_state.dart';
import 'package:wemo/feature/home/widgets/buy_coins_list.dart';
import 'package:wemo/feature/home/widgets/coin_row_widget.dart';
import 'package:wemo/res/theme.dart';

void main() {
  late MockHomeBloc mockHomeBloc;

  setUp(() {
    mockHomeBloc = MockHomeBloc();
  });
  group('CoinRowWidget', () {
    testWidgets('Сoin price color', (widgetTester) async {
      final coin = Coin(name: 'BTC', price: 51000.0);
      final homeState = HomeState(previousPrices: {'BTC': 50000.0});

      when(() => mockHomeBloc.state).thenReturn(homeState);

      when(
        () => mockHomeBloc.stream,
      ).thenAnswer((_) => Stream.value(homeState));

      when(() => mockHomeBloc.close()).thenAnswer((_) async => Future.value());

      await widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<HomeBloc>(
              create: (context) => mockHomeBloc,
              child: CoinsListWidget(coins: [coin]),
            ),
          ),
        ),
      );

      final cryptoRow = widgetTester.widget<CryptoRow>(find.byType(CryptoRow));
      expect(cryptoRow.color, ProjectColors.green);
    });
  });
}

class MockHomeBloc extends Mock implements HomeBloc {}
