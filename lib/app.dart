import 'package:flutter/material.dart';
import 'package:scaleup/core/config/app_router.dart';
import 'package:scaleup/core/config/theme/app_theme.dart';
import 'package:scaleup/utils/global_keys.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      onGenerateRoute: AppRouter.onGenerateRoute,
      theme: AppTheme.getTheme(),
    );
  }
}
