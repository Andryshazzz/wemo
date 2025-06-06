import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../res/theme.dart' show ProjectColors;
import '../screens/coin_sell_screen/coin_sell_screen.dart';
import '../controller/home_bloc.dart';
import '../controller/home_state.dart';
import 'coin_row_widget.dart';

class PortfolioListWidget extends StatelessWidget {
  final Map<String, double> portfolio;

  const PortfolioListWidget({super.key, required this.portfolio});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      child: DecoratedBox(
        decoration: BoxDecoration(color: ProjectColors.light4),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: portfolio.length,
          itemBuilder:
              (context, index) => BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  final coinName = portfolio.keys.elementAt(index);
                  final purchasePrice = portfolio[coinName]!;
                  return CryptoRow(
                    name: coinName,
                    //TO DO: correct price
                    price: state.coins[index].price.toString(),
                    previousPrices: purchasePrice.toInt().toString(),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (context) => CoinSellScreen(
                                coinName: coinName,
                                price: purchasePrice.toString(),
                              ),
                        ),
                      );
                    },
                  );
                },
              ),
          separatorBuilder:
              (context, index) => const Divider(height: 1, thickness: 1),
        ),
      ),
    );
  }
}
