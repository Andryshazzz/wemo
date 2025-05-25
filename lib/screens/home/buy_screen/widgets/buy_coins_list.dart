import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/coin.dart';
import '../../../../res/theme.dart';
import '../../coin_screen/coin_screen.dart';
import '../../controller/home_bloc.dart';
import '../../controller/home_state.dart';
import '../../widgets/coin_row_widget.dart';

class CoinsListWidget extends StatelessWidget {
  final List<Coin> coins;

  const CoinsListWidget({super.key, required this.coins});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      child: DecoratedBox(
        decoration: BoxDecoration(color: ProjectColors.light4),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: coins.length,
          itemBuilder:
              (context, index) => BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  final previousPrice = state.previousPrices[coins[index].name];
                  final priceChange =
                      previousPrice != null
                          ? coins[index].price - previousPrice
                          : 0.0;
                  final percentageChange =
                      previousPrice != null && previousPrice != 0
                          ? (priceChange / previousPrice) * 100
                          : 0.0;
                  final isPriceUp = priceChange > 0 || previousPrice == null;

                  return CryptoRow(
                    name: coins[index].name,
                    price: coins[index].price.toString(),
                    previousPrices:
                        '${priceChange.toStringAsFixed(2)} (${percentageChange.toStringAsFixed(2)}%)',
                    color: isPriceUp ? ProjectColors.green : ProjectColors.red,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (context) => CoinScreen(
                                coinName: coins[index].name,
                                price: coins[index].price.toString(),
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
