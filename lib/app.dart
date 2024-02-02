import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scaleup/core/config/app_router.dart';
import 'package:scaleup/core/config/theme/app_theme.dart';
import 'package:scaleup/core/config/theme/current_theme_provider.dart';
import 'package:scaleup/utils/global_keys.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      onGenerateRoute: AppRouter.onGenerateRoute,
      theme: AppTheme.getTheme(),
      darkTheme: AppTheme.getTheme(isDark: true),
      themeMode: ref.watch(currentThemeProvider),
    );
  }
}
