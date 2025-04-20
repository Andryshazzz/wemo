import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  textTheme: textTheme,
  useMaterial3: true,
  scaffoldBackgroundColor: light1,
);

final darkTheme = ThemeData(
  textTheme: textTheme,
  useMaterial3: true,
  scaffoldBackgroundColor: Color(0xFF0D0D0D),
);

const textTheme = TextTheme(
  titleMedium: TextStyle(fontSize: 16),
  titleLarge: TextStyle(),
);

const light1 = Color(0xFFE8E8E8);
const light2 = Color(0xFFDDDDDD);
const light3 = Color(0xFFF4F4F4);
const light4 = Color(0xFFF9F9F9);
const light5 = Color(0xFFFEFEFE);
const light6 = Color(0xFFEAEAEA);
const light7 = Color(0xFFDBDBDB);

const green = Color(0xFF34A40C);
const red = Color(0xFFDA2828);

const black1 = Color(0xFF000000);
