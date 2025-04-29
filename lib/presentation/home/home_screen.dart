import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../theme/theme.dart';
import 'widgets/burger_button.dart';
import 'widgets/buy_sell.dart';
import 'widgets/coins_expansion.dart';
import 'widgets/portfolio.dart';

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
  final double _basePadding = 12;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _basePadding),
      child: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(_basePadding),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  SvgPicture.asset(ProjectIcons.wemo),
                  Spacer(),
                  BurgerButton(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: PortfolioWidget(price: "22 312.32")),
          SliverPadding(
            padding: EdgeInsets.only(top: _basePadding / 2),
            sliver: SliverToBoxAdapter(child: BuySellWidget()),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: _basePadding, bottom: _basePadding),
            sliver: SliverToBoxAdapter(child: CoinsExpansionWidget()),
          ),
          SliverToBoxAdapter(child: CurrenciesExpansionWidget()),
        ],
      ),
    );
  }
}
