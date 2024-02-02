import 'package:flutter/material.dart';
import 'package:healie/core/config/theme/app_colors.dart';

class AppTheme {
  static ThemeData getTheme({isDark = false}) => ThemeData(
        brightness: isDark ? Brightness.dark : Brightness.light,
        scaffoldBackgroundColor: AppColors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: isDark ? AppColors.black : AppColors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        // filledButtonTheme: FilledButtonThemeData(
        //     style: FilledButton.styleFrom(
        //         shape: const RoundedRectangleBorder(
        //   borderRadius: kBorderRadiusSm,
        // ))),
      );
}
