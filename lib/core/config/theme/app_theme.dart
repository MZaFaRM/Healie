import 'package:flutter/material.dart';
import 'package:scaleup/core/constants/ui_constants.dart';

class AppTheme {
  static ThemeData getTheme({isDark = false}) => ThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
              shape: const RoundedRectangleBorder(
        borderRadius: kBorderRadiusSm,
      ))));
}
