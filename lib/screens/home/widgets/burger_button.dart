import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/theme.dart';

class BurgerButton extends StatelessWidget {
  const BurgerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 30),
      child: DecoratedBox(
        decoration: BoxDecoration(color: light4),
        child: SvgPicture.asset(ProjectIcons.burger),
      ),
    );
  }
}
