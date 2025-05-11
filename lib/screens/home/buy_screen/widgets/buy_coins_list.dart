import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/coin.dart';
import '../../../../res/theme.dart';
import '../../widgets/coin_row_widget.dart';

class CoinsListWidget extends StatelessWidget {
  final List<Coin> coins;

  const CoinsListWidget({super.key, required this.coins});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: ProjectColors.light4,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: coins.length,
        itemBuilder:
            (context, index) => CryptoRow(
              name: coins[index].name,
              price: coins[index].price.toString(),
              previousPrices: '',
            ),
        separatorBuilder:
            (context, index) => const Divider(height: 1, thickness: 1),
      ),
    );
  }
}
