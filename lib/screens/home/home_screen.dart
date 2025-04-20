import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wemo/screens/home/widgets/buy_sell.dart';
import 'package:wemo/screens/home/widgets/portfolio.dart';

import 'widgets/coins_expansion.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _HomeScreen();
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _CoinsList()));
  }
}

class _CoinsList extends StatefulWidget {
  const _CoinsList({super.key});

  @override
  State<_CoinsList> createState() => _CoinsListState();
}

class _CoinsListState extends State<_CoinsList> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(1),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Text('Wemo'),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.abc)),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: PortfolioWidget()),
          SliverPadding(
            padding: EdgeInsets.only(top: 6),
            sliver: SliverToBoxAdapter(child: BuySellWidget()),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 8, bottom: 14),
            sliver: SliverToBoxAdapter(child: CoinsExpansionWidget()),
          ),
          SliverToBoxAdapter(child: CoinsExpansionWidget()),
        ],
      ),
    );
  }
}
