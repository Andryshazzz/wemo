import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import '../../data/models/coin_dto.dart';
import '../../res/theme.dart';
import 'controller/home_bloc.dart';
import 'controller/home_event.dart';
import 'controller/home_state.dart';
import 'widgets/burger_button.dart';
import 'widgets/buy_sell.dart';
import 'widgets/coins_expansion.dart';
import 'widgets/portfolio.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return GetIt.I<HomeBloc>()..add(LoadCoin());
      },
      child: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.coins.isEmpty) {
              return const Text('ой-ой');
            }
            return _CoinsList(coins: state.coins);
          },
        ),
      ),
    );
  }
}

class _CoinsList extends StatefulWidget {
  final List<CoinDto> coins;

  const _CoinsList({super.key, required this.coins});

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
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<HomeBloc>().add(LoadCoin());
          await context.read<HomeBloc>().stream.firstWhere(
            (state) => !state.isLoading,
          );
        },
        elevation: 0,
        color: ProjectColors.black,
        backgroundColor: Colors.transparent,
        displacement: 10,
        strokeWidth: 2,
        child: CustomScrollView(
          controller: _controller,
          physics: const AlwaysScrollableScrollPhysics(),
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
              sliver: SliverToBoxAdapter(
                child: ExpansionWidget(title: 'Coins', coins: widget.coins),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
