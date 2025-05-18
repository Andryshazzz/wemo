import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../res/theme.dart';
import '../buy_screen/buy_screen.dart';
import 'button.dart';

class MarketRoute extends StatelessWidget {
  const MarketRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You haven't bought\nanything yet",
            textAlign: TextAlign.center,
            style: ProjectTextStyles.p1.copyWith(color: ProjectColors.grey3),
          ),
          SizedBox(height: 16),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 165),
            child: ButtonWidget(
              title: 'Open market',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const BuyScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
