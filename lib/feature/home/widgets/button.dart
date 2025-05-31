import 'package:flutter/material.dart';

import '../../../res/theme.dart';

class ButtonWidget extends StatelessWidget {
  final GestureTapCallback onTap;
  final String title;

  const ButtonWidget({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.all(Radius.circular(16));
    return ClipRRect(
      borderRadius: radius,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: DecoratedBox(
          decoration: BoxDecoration(color: ProjectColors.dark5),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(
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
