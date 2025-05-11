import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../res/dependencies.dart';
import '../../../res/theme.dart';
import '../trade_screen/trade_screen.dart';
import 'trade.dart';

class ButtonWidget extends StatelessWidget {
  final String title;

  const ButtonWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.all(Radius.circular(16));
    return ClipRRect(
      borderRadius: radius,
      child: InkWell(
        onTap: () {
          getIt.registerSingleton<TradeType>(TradeType.buy);
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const TradeScreen()));
        },
        borderRadius: radius,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 54),
          child: DecoratedBox(
            decoration: BoxDecoration(color: ProjectColors.dark5),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Text(
                title,
                style: ProjectTextStyles.p1.copyWith(
                  color: ProjectColors.light5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
