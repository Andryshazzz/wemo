import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: ProjectColors.light1,
);

final darkTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Color(0xFF0D0D0D),
);

class ProjectColors {
  static const light1 = Color(0xFFE8E8E8);
  static const light2 = Color(0xFFDDDDDD);
  static const light3 = Color(0xFFF4F4F4);
  static const light4 = Color(0xFFF9F9F9);
  static const light5 = Color(0xFFFEFEFE);
  static const light6 = Color(0xFFEAEAEA);
  static const light7 = Color(0xFFDBDBDB);

  static const black = Color(0xFF000000);
  static const dark1 = Color(0xFF0D0D0D);
  static const dark2 = Color(0xFF131313);
  static const dark3 = Color(0xFF202020);
  static const dark4 = Color(0xFF252525);
  static const dark5 = Color(0xFF2E2E2E);
  static const dark6 = Color(0xFF323232);
  static const dark7 = Color(0xFF3B3B3B);

  static const green = Color(0xFF34A40C);
  static const red = Color(0xFFDA2828);

  static const grey1 = Color(0xFFE9E9E9);
  static const grey3 = Color(0xFF959595);
  static const grey5 = Color(0xFFADADAD);
  static const grey6 = Color(0xFF828282);
  static const grey7 = Color(0xFF5E5E5E);
}

class ProjectTextStyles {
  static const h1 = TextStyle(fontFamily: 'Geist', fontSize: 28);
  static const h2 = TextStyle(fontFamily: 'Geist', fontSize: 19);
  static const p1 = TextStyle(fontFamily: 'Geist', fontSize: 17);
  static const p2 = TextStyle(fontFamily: 'Geist', fontSize: 15);
  static const sub = TextStyle(fontFamily: 'Geist', fontSize: 12);
}

class ProjectIcons {
  static const String wemo = 'assets/icons/wemo_logo.svg';
  static const String burger = 'assets/icons/burger.svg';
  static const String sell = 'assets/icons/sell.svg';
  static const String buy = 'assets/icons/buy.svg';
}
