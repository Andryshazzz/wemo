import 'package:flutter/material.dart';

import '../../res/theme.dart';
import '../../res/theme.dart';
import 'widgets/coins_list_widget.dart';
import 'widgets/segmented_control_buttons.dart';

class CoinsBuyScreen extends StatelessWidget {
  const CoinsBuyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _CoinsBuyScreen();
  }
}

class _CoinsBuyScreen extends StatelessWidget {
  const _CoinsBuyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _CoinsBuyList()));
  }
}

class _CoinsBuyList extends StatefulWidget {
  const _CoinsBuyList({super.key});

  @override
  State<_CoinsBuyList> createState() => _CoinsBuyListState();
}

class _CoinsBuyListState extends State<_CoinsBuyList>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this);
  final ScrollController _controller = ScrollController();
  final double _basePadding = 12;

  @override
  void dispose() {
    _tabController.dispose();
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
          SliverAppBar(
            pinned: true,
            surfaceTintColor: Colors.transparent,
            title: Text(
              'Buy',
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
