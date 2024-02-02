import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentThemeProvider = StateProvider((ref) => ThemeMode.system);
