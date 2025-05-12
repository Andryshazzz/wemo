import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../res/theme.dart';
import '../coin_screen/coin_screen.dart';

class CryptoRow extends StatelessWidget {
  final String name;
  final String price;
  final String previousPrices;
  final Color? color;

  const CryptoRow({
    required this.name,
    required this.price,
    required this.previousPrices,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const CoinScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name, style: ProjectTextStyles.h2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
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
                  previousPrices,
                  style: ProjectTextStyles.sub.copyWith(color: color),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
