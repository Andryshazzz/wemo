import 'package:flutter/material.dart';

import '../../../data/models/coin_dto.dart';
import '../../../res/theme.dart';

class ExpansionWidget extends StatelessWidget {
  final List<CoinDto> coins;
  final String title;

  const ExpansionWidget({super.key, required this.title, required this.coins});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ProjectColors.light5,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            dividerColor: Colors.transparent,
            expansionTileTheme: const ExpansionTileThemeData(),
          ),
          child: ExpansionTile(
            tilePadding: EdgeInsets.symmetric(horizontal: 16),
            collapsedBackgroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(),
            collapsedShape: const RoundedRectangleBorder(),
            trailing: Builder(
              builder: (context) {
                return Text(
                  "See all",
                  style: ProjectTextStyles.p1.copyWith(
                    color: ProjectColors.grey3,
                  ),
                );
              },
            ),
            title: Text(title, style: ProjectTextStyles.p1),
            children: [..._buildCoinList()],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCoinList() {
    final List<Widget> widgets = [];

    for (var i = 0; i < coins.length; i++) {
      widgets.add(
        Column(
          children: [
            if (i != 0)
              const Divider(
                height: 1,
                thickness: 0.5,
                color: ProjectColors.light7,
              ),
            _Coin(coin: coins[i]),
          ],
        ),
      );
    }
    return widgets;
  }
}

class _Coin extends StatelessWidget {
  final CoinDto coin;

  const _Coin({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    final parts = coin.price.toString().split('.');
    return DecoratedBox(
      decoration: BoxDecoration(color: ProjectColors.light4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(coin.name, style: ProjectTextStyles.h2),
                const SizedBox(width: 6),
                Text(
                  coin.price.toString(),
                  style: ProjectTextStyles.sub.copyWith(
                    color: ProjectColors.grey3,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        style: ProjectTextStyles.h2,
                        children: [
                          TextSpan(
                            text: parts[0],
                            style: const TextStyle(color: ProjectColors.black),
                          ),
                          TextSpan(
                            text:
                                '.${parts[1]}'
                                r'$',
                            style: const TextStyle(color: ProjectColors.grey3),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  '329.32 (1,03%)',
                  style: ProjectTextStyles.sub.copyWith(
                    color: ProjectColors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
