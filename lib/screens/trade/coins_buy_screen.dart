import 'package:flutter/material.dart';

import '../../dependencies.dart';
import '../../res/theme.dart';
import '../home/widgets/buy_sell.dart';
import 'widgets/coins_list_widget.dart';
import 'widgets/segmented_control_buttons.dart';

class TradeScreen extends StatelessWidget {
  const TradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _TradeScreen();
  }
}

class _TradeScreen extends StatelessWidget {
  const _TradeScreen({super.key});

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

class _CoinsListState extends State<_CoinsList>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this);
  late final TradeType tradeType = getIt<TradeType>();
  final ScrollController _controller = ScrollController();
  final double _basePadding = 12;

  @override
  void dispose() {
    _tabController.dispose();
    _controller.dispose();
    if (getIt.isRegistered<TradeType>()) {
      getIt.unregister<TradeType>();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _basePadding),
      child: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverAppBar(
            pinned: true,
            surfaceTintColor: Colors.transparent,
            title: Text(
              tradeType == TradeType.buy ? 'Buy' : 'Sell',
              style: ProjectTextStyles.h2.copyWith(fontWeight: FontWeight.w600),
            ),
            backgroundColor: ProjectColors.light1,
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: _basePadding),
            sliver: SliverToBoxAdapter(
              child: SegmentedControlButtonsWidget(
                items: const [Text('Coins'), Text('Currencies')],
                controller: _tabController,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 360,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 4),
                    child: CoinsListWidget(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: CoinsListWidget(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
