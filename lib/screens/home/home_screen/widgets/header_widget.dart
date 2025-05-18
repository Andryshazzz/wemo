import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../res/theme.dart';
import '../../../settings/settings_screen/settings_screen.dart';
import '../../widgets/burger_button.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(ProjectIcons.wemo),
        Spacer(),
        BurgerButton(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SettingScreen()),
            );
          },
        ),
      ],
    );
  }
}
