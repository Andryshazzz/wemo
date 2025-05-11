import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../res/theme.dart';
import '../../widgets/burger_button.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(ProjectIcons.wemo),
        Spacer(),
        BurgerButton(onTap: () {}),
      ],
    );
  }
}
