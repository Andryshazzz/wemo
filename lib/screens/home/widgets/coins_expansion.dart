import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class CoinsExpansionWidget extends StatelessWidget {
  const CoinsExpansionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xffFEFEFE),
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
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                );
              },
            ),
            title: Text(
              "Coins",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            children: const [
              Divider(height: 1, thickness: 0.5, color: light7),
              _Coin(name: "Bitcoin", price: "85 317.97"),
              Divider(height: 1, thickness: 0.5, color: light7),
              _Coin(name: "Bitcoin", price: "85 317.97"),
              Divider(height: 1, thickness: 0.5, color: light7),
              _Coin(name: "Bitcoin", price: "85 317.97"),
              Divider(height: 1, thickness: 0.5, color: light7),
              _Coin(name: "Bitcoin", price: "85 317.97"),
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
      decoration: BoxDecoration(color: light4),
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
                    Text(name, style: TextStyle(fontSize: 14)),
                    Text('(BTC)'),
                  ],
                ),
                Text('1.23123'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(price, style: TextStyle(fontSize: 19, color: black1)),
                  ],
                ),
                Text('329.32 (1,03%)', style: TextStyle(color: green)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
