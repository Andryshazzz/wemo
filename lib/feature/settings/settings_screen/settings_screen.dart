import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../res/theme.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ProjectColors.light1,
        title: Text(
          'Settings',
          style: ProjectTextStyles.h2.copyWith(fontWeight: FontWeight.w600),
        ),
      ),

      body: Center(child: Text('Comming Soon...')),
    );
  }
}
