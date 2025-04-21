import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class PortfolioWidget extends StatelessWidget {
  const PortfolioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final String price = "22 312.32";
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      child: InkWell(
        onTap: () {},
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 200,
            maxWidth: double.infinity,
          ),
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
                          text: price.split('.')[0],
                          style: const TextStyle(color: black1),
                        ),
                        TextSpan(
                          text: '.${price.split('.')[1]}\$',
                          style: TextStyle(color: grey),
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
