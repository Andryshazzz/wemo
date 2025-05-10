import 'package:flutter/cupertino.dart';

import '../../../../res/theme.dart';
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
          ButtonWidget(title: 'Open market'),
        ],
      ),
    );
  }
}
