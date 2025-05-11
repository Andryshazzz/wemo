import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../res/theme.dart';
import '../buy_screen/buy_screen.dart';
import '../controller/home_bloc.dart';
import '../sell_screen/sell_screen.dart';

class TradeWidget extends StatelessWidget {
  const TradeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _Button(
            text: 'Buy',
            icon: ProjectIcons.buy,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (context) => BlocProvider.value(
                        value: context.read<HomeBloc>(),
                        child: const BuyScreen(),
                      ),
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: _Button(
            text: 'Sell',
            icon: ProjectIcons.sell,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SellScreen()),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  final String text;
  final String icon;
  final void Function() onTap;

  const _Button({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const radius = BorderRadius.all(Radius.circular(12));
    return ClipRRect(
      borderRadius: radius,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 52),
          child: DecoratedBox(
            decoration: BoxDecoration(color: ProjectColors.light5),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(icon),
                  const SizedBox(width: 8),
                  Text(text, style: ProjectTextStyles.p1),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
