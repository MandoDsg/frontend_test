import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Color(0XFF44809D),
    onBackground: Color(0XFFD9E5EB),
    primary: Color(0XFF2D5468),
    secondary: Color(0XFFA1BFCE),
    tertiary: Colors.black,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: Color(0XFF072E33),
    onBackground: Color(0XFF05161A),
    primary: Color(0XFF0F969C),
    secondary: Color(0XFF074346),
    tertiary: Colors.white,
  ),
);
