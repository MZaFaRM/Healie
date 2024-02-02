import 'package:flutter/foundation.dart';

extension StringExtension on String {
  String get capitalize {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension IfDebugging on String {
  String? get ifDebugging => kDebugMode ? this : null;
}
