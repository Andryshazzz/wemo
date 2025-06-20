import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wemo/data/models/coin.dart';
import 'package:wemo/feature/home/controller/home_bloc.dart';
import 'package:wemo/feature/home/controller/home_state.dart';
import 'package:wemo/feature/home/screens/home_screen/home_screen.dart';
import 'package:wemo/feature/home/widgets/buy_coins_list.dart';
import 'package:wemo/feature/home/widgets/coin_row_widget.dart';
import 'package:wemo/res/theme.dart';

void main() {
  late MockHomeBloc mockHomeBloc;

  setUp(() async {
    await loadAppFonts();
    mockHomeBloc = MockHomeBloc();
  });

  tearDown(() {
    mockHomeBloc.close();
  });

  group('CoinRowWidget', () {
    testWidgets('Сoin price color', (tester) async {
      final coin = Coin(name: 'BTC', price: 51000.0);
      final homeState = HomeState(previousPrices: {'BTC': 50000.0});

      when(() => mockHomeBloc.state).thenReturn(homeState);

      when(
        () => mockHomeBloc.stream,
      ).thenAnswer((_) => Stream.value(homeState));

      when(() => mockHomeBloc.close()).thenAnswer((_) async => Future.value());

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<HomeBloc>(
              create: (context) => mockHomeBloc,
              child: CoinsListWidget(coins: [coin]),
            ),
          ),
        ),
      );

      final cryptoRow = tester.widget<CryptoRow>(find.byType(CryptoRow));
      expect(cryptoRow.color, ProjectColors.green);
      await expectLater(
        find.byType(CryptoRow),
        matchesGoldenFile('teml/coin_row_widget.png'),
      );
    });
  });

  group('ExpansionWidget golden tests', () {
    final testCoins = [
      Coin(name: 'Bitcoin', price: 50000.1234),
      Coin(name: 'Ethereum', price: 3000.5678),
      Coin(name: 'Solana', price: 150.9012),
    ];

    void setupMockHomeBloc() {
      when(() => mockHomeBloc.state).thenReturn(
        HomeState(
          isLoading: false,
          coins: testCoins,
          previousPrices: {
            'Bitcoin': 49000.0,
            'Ethereum': 2900.0,
            'Solana': 140.0,
          },
        ),
      );
      when(() => mockHomeBloc.stream).thenAnswer(
        (_) => Stream.value(
          HomeState(
            isLoading: false,
            coins: testCoins,
            previousPrices: {
              'Bitcoin': 49000.0,
              'Ethereum': 2900.0,
              'Solana': 140.0,
            },
          ),
        ),
      );
    }

    Widget buildTestWidget() {
      return MaterialApp(
        home: BlocProvider<HomeBloc>.value(
          value: mockHomeBloc,
          child: const HomeScreen(),
        ),
      );
    }

    testGoldens('should render collapsed state on all devices', (tester) async {
      setupMockHomeBloc();

      await tester.pumpWidgetBuilder(
        buildTestWidget(),
        wrapper: materialAppWrapper(theme: ThemeData.light()),
        surfaceSize: Size(414, 896),
      );

      await multiScreenGolden(
        tester,
        'expansion_widget_collapsed',
        devices: [
          Device.phone,
          Device.iphone11,
          Device.tabletPortrait,
          Device.tabletLandscape,
        ],
      );
    });

    testGoldens('should render expanded state on all devices', (tester) async {
      setupMockHomeBloc();

      await tester.pumpWidgetBuilder(
        buildTestWidget(),
        wrapper: materialAppWrapper(theme: ThemeData.light()),
        surfaceSize: Size(414, 896),
      );

      final expansionTileFinder = find.byKey(const Key('coins_expansion_tile'));
      expect(expansionTileFinder, findsOneWidget);

      await tester.tap(expansionTileFinder);
      await tester.pumpAndSettle();

      await multiScreenGolden(
        tester,
        'expansion_widget_expanded',
        devices: [
          Device.phone,
          Device.iphone11,
          Device.tabletPortrait,
          Device.tabletLandscape,
        ],
      );
    });
  });
}

class MockHomeBloc extends Mock implements HomeBloc {}
