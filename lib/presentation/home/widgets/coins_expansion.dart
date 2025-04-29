import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class CoinsExpansionWidget extends StatelessWidget {
  const CoinsExpansionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionWidget(title: 'Coins', price: '85 317.97');
  }
}

class CurrenciesExpansionWidget extends StatelessWidget {
  const CurrenciesExpansionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionWidget(title: 'Currencies', price: '85 317.97');
  }
}

class ExpansionWidget extends StatelessWidget {
  final String title;
  final String price;

  const ExpansionWidget({super.key, required this.title, required this.price});

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
            children: [
              const Divider(
                height: 1,
                thickness: 0.5,
                color: ProjectColors.light7,
              ),
              _Coin(name: "Bitcoin", price: price),
              const Divider(
                height: 1,
                thickness: 0.5,
                color: ProjectColors.light7,
              ),
              _Coin(name: "Toncoin", price: price),
              const Divider(
                height: 1,
                thickness: 0.5,
                color: ProjectColors.light7,
              ),
              _Coin(name: "Ethereum", price: price),
            ],
          ),
        ),
      ),
    );
  }
}

class _Coin extends StatelessWidget {
  final String name;
  final String price;

  const _Coin({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
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
                Row(
                  children: [
                    Text(name, style: ProjectTextStyles.h2),
                    const SizedBox(width: 6),
                    Text(
                      '(BTC)',
                      style: ProjectTextStyles.p1.copyWith(
                        color: ProjectColors.light3,
                      ),
                    ),
                  ],
                ),
                Text(
                  '1.23123',
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
                            text: price.split('.')[0],
                            style: const TextStyle(color: ProjectColors.black),
                          ),
                          TextSpan(
                            text: '.${price.split('.')[1]}\$',
                            style: TextStyle(color: ProjectColors.grey3),
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
