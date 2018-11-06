// Copyright 2018 Olivetti Scuola Digitale. All rights reserved.
// Giorgio Modoni <modogio@gmail.com>

import 'package:flutter/material.dart';

ThemeData buildTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      primaryColor: Colors.blue,
      accentColor: Colors.orange,
      brightness: Brightness.light);
}

/*

/// create a custom colors
const MaterialColor customPrimary = const MaterialColor(0xFFCF0038, const<int, Color>{

  50: const Color(0xFFf9e0e7),
  100: const Color(0xFFf1b3c3),
  200: const Color(0xFFe7809c),
  300: const Color(0xFFdd4d74),
  400: const Color(0xFFd62656),
  500: const Color(0xFFcf0038),
  600: const Color(0xFFca0032),
  700: const Color(0xFFc3002b),
  800: const Color(0xFFbd0024),
  900: const Color(0xFFb20017),
});
*/

/*
/// define theme components
ThemeData buildTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: kShrineBrown900,
    primaryColor: kShrinePink100,
    buttonColor: kShrinePink100,
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    cardColor: kShrineBackgroundWhite,
    textSelectionColor: kShrinePink100,
    errorColor: kShrineErrorRed,
    buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
    primaryIconTheme: base.iconTheme.copyWith(color: kShrineBrown900),
    inputDecorationTheme: InputDecorationTheme(border: CutCornersBorder()),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
  );
}
*/
