import 'package:flutter/material.dart';
import 'package:healie/core/config/theme/app_colors.dart';

class AppTheme {
  static ThemeData getTheme({isDark = false}) => ThemeData(
        brightness: isDark ? Brightness.dark : Brightness.light,
        fontFamily: "Inter",
        scaffoldBackgroundColor: isDark ? AppColors.black : AppColors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: isDark ? AppColors.black : AppColors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        colorScheme: isDark
            ? ColorScheme.fromSeed(
                seedColor: const Color(0xFF0070F0),
                brightness: Brightness.dark,
              )
            : ColorScheme.fromSeed(seedColor: const Color(0xFF0070F0)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primary,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          backgroundColor: isDark ? AppColors.black : AppColors.white,
          elevation: 0,
        ),
        // filledButtonTheme: FilledButtonThemeData(
        //     style: FilledButton.styleFrom(
        //         shape: const RoundedRectangleBorder(
        //   borderRadius: kBorderRadiusSm,
        // ))),
      );
}
