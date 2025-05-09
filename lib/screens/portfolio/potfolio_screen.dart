import 'package:flutter/material.dart';

import '../../moc.dart';
import '../../res/theme.dart';
import '../trade/widgets/coins_list_widget.dart';
import '../trade/widgets/segmented_control_buttons.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _PortfolioScreen();
  }
}

class _PortfolioScreen extends StatelessWidget {
  const _PortfolioScreen({super.key});

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

  List<Map<String, dynamic>> _coinsPortfolio = [];
  List<Map<String, dynamic>> _currenciesPortfolio = [];

  Future<void> _loadPortfolioData() async {
    setState(() {
      _coinsPortfolio = loadedCoins;
      _currenciesPortfolio = loadedCurrencies;
    });
  }

  void _addToPortfolio(Map<String, dynamic> item, bool isCoin) {
    setState(() {
      if (isCoin) {
        // Проверяем, есть ли уже такая монета в портфеле
        final index = _coinsPortfolio.indexWhere(
          (element) => element['id'] == item['id'],
        );
        if (index >= 0) {
          // Обновляем количество
          _coinsPortfolio[index]['amount'] += item['amount'];
          _coinsPortfolio[index]['value'] += item['value'];
        } else {
          // Добавляем новую запись
          _coinsPortfolio.add(item);
        }
      } else {
        // Аналогично для валют
        final index = _currenciesPortfolio.indexWhere(
          (element) => element['id'] == item['id'],
        );
        if (index >= 0) {
          _currenciesPortfolio[index]['amount'] += item['amount'];
          _currenciesPortfolio[index]['value'] += item['value'];
        } else {
          _currenciesPortfolio.add(item);
        }
      }
    });

    // Здесь можно сохранить данные в хранилище
  }

  @override
  void initState() {
    super.initState();
    _loadPortfolioData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasCoins = _coinsPortfolio.isNotEmpty;
    final hasCurrencies = _currenciesPortfolio.isNotEmpty;

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
