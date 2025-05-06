import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../res/theme.dart';

class BurgerButton extends StatelessWidget {
  const BurgerButton({super.key});

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.all(Radius.circular(12));
    return ClipRRect(
      borderRadius: radius,
      child: InkWell(
        onTap: () {},
        borderRadius: radius,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 30, maxWidth: 42),
          child: DecoratedBox(
            decoration: BoxDecoration(color: Color(0xffFEFEFE)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 11),
              child: SvgPicture.asset(ProjectIcons.burger),
            ),
          ),
        ),
      ),
    );
  }
}
