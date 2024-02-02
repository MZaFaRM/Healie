import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme({isDark = false}) => ThemeData(
        brightness: isDark ? Brightness.dark : Brightness.light,
        // filledButtonTheme: FilledButtonThemeData(
        //     style: FilledButton.styleFrom(
        //         shape: const RoundedRectangleBorder(
        //   borderRadius: kBorderRadiusSm,
        // ))),
      );
}
