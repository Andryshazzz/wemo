import 'package:flutter/material.dart';

import 'presentation/home/home_screen.dart';
import 'theme/theme.dart';

void main() {
  runApp(const Wemo());
}

class Wemo extends StatelessWidget {
  const Wemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: lightTheme, home: HomeScreen());
  }
}
