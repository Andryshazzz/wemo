import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class PortfolioWidget extends StatelessWidget {
  final String price;

  const PortfolioWidget({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    final _price = price;
    const radius = BorderRadius.all(Radius.circular(12));
    return ClipRRect(
      borderRadius: radius,
      child: InkWell(
        onTap: () {},
        borderRadius: radius,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 200),
          child: DecoratedBox(
            decoration: BoxDecoration(color: Color(0xffFEFEFE)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('balance', style: ProjectTextStyles.p1),
                  const Spacer(),
                  Text.rich(
                    TextSpan(
                      style: ProjectTextStyles.h1,
                      children: [
                        TextSpan(
                          text: _price.split('.')[0],
                          style: const TextStyle(color: ProjectColors.black),
                        ),
                        TextSpan(
                          text: '.${_price.split('.')[1]}\$',
                          style: TextStyle(color: ProjectColors.grey3),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
