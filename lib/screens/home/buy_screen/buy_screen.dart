import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../res/theme.dart';
import '../controller/home_bloc.dart';
import '../controller/home_event.dart';
import '../controller/home_state.dart';
import '../widgets/segmented_control_buttons.dart';
import 'widgets/buy_coins_list.dart';

class BuyScreen extends StatelessWidget {
  const BuyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: _BuyList()));
  }
}

class _BuyList extends StatefulWidget {
  const _BuyList({super.key});

  @override
  State<_BuyList> createState() => _BuyListState();
}

class _BuyListState extends State<_BuyList>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this);
  final ScrollController _controller = ScrollController();
  final double _basePadding = 12;

  @override
  void initState() {
    context.read<HomeBloc>().add(LoadCoin());
    super.initState();
  }

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
              height: 650,
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state.coins.isEmpty) {
                    return const Text('ой-ой');
                  }
                  return TabBarView(
                    controller: _tabController,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 4),
                        child: CoinsListWidget(coins: state.coins),
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
