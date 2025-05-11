import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../res/theme.dart';
import '../controller/home_bloc.dart';
import '../controller/home_state.dart';
import '../widgets/coins_list_widget.dart';
import '../widgets/segmented_control_buttons.dart';
import '../widgets/market_route.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _PortfolioList()));
  }
}

class _PortfolioList extends StatefulWidget {
  const _PortfolioList({super.key});

  @override
  State<_PortfolioList> createState() => _PortfolioListState();
}

class _PortfolioListState extends State<_PortfolioList>
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
              'Portfolio',
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
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  final portfolio = state.portfolio;
                  return TabBarView(
                    controller: _tabController,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 4),
                        child:
                            portfolio.isEmpty
                                ? MarketRoute()
                                : CoinsListWidget(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Center(child: Text('Comming Soon...')),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
