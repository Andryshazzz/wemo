import 'package:flutter/material.dart';

import 'dependencies.dart';
import 'res/theme.dart';
import 'screens/home/home_screen.dart';

void main() {
  configureDependencies();
  runApp(const Wemo());
}

class Wemo extends StatelessWidget {
  const Wemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: lightTheme, home: const HomeScreen());
  }
}
