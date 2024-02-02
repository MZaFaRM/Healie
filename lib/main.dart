import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:replicate/replicate.dart';
import 'package:healie/app.dart';
import 'package:healie/env.dart';

void main() {
  Replicate.apiKey = Env.apiKey;
  runApp(const ProviderScope(child: MyApp()));
}
