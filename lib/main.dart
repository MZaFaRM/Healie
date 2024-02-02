import 'package:flutter/material.dart';
import 'package:replicate/replicate.dart';
import 'package:scaleup/app.dart';
import 'package:scaleup/config/env.dart';

void main() {
  Replicate.apiKey = Env.apiKey;
  runApp(const MyApp());
}
