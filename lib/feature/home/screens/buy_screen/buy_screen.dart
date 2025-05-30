import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../res/theme.dart';
import '../../controller/home_bloc.dart';
import '../../controller/home_event.dart';
import '../../controller/home_state.dart';
import '../../widgets/restarting.dart';
import '../../widgets/segmented_control_buttons.dart';
import '../../widgets/buy_coins_list.dart';

class BuyScreen extends StatefulWidget {
  const BuyScreen({super.key});

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen>
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
    final homeBloc = context.read<HomeBloc>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _basePadding),
          child: RefreshIndicator(
            onRefresh: () async {
              homeBloc.add(LoadCoin());
              await homeBloc.stream.firstWhere((state) => !state.isLoading);
            },
            elevation: 0,
            color: ProjectColors.black,
            backgroundColor: Colors.transparent,
            displacement: 10,
            strokeWidth: 2,
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _controller,
              slivers: [
                SliverAppBar(
                  pinned: true,
                  surfaceTintColor: Colors.transparent,
                  title: Text(
                    'Buy',
                    style: ProjectTextStyles.h2.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
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
                    height: 660,
                    child: BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state.coins.isEmpty) {
                          return const RestartingWidget();
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
          ),
        ),
      ),
    );
  }
}
