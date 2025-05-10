import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../res/theme.dart';

class CoinsListWidget extends StatelessWidget {
  const CoinsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cryptocurrencies = <Map<String, String>>[

      {'name': 'Ethereum', 'price': '2,350.75'},
      {'name': 'Cardano', 'price': '1.25'},
      {'name': 'Solana', 'price': '125.60'},
      {'name': 'Polkadot', 'price': '25.30'},
    ];
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: ProjectColors.light4,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: cryptocurrencies.length,
        itemBuilder:
            (context, index) => _CryptoRow(
              name: cryptocurrencies[index]['name']!,
              price: cryptocurrencies[index]['price']!,
            ),
        separatorBuilder:
            (context, index) => const Divider(height: 1, thickness: 1),
      ),
    );
  }
}

class _CryptoRow extends StatelessWidget {
  final String name;
  final String price;

  const _CryptoRow({required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                '329.32 (1,03%)',
                style: ProjectTextStyles.sub.copyWith(
                  color: ProjectColors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
