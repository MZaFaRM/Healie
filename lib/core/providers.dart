import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider((ref) {
  final options = BaseOptions(
    baseUrl: 'https://scale-up-4xnq.onrender.com',
  );
  final dio = Dio(options);
  dio.interceptors.add(LogInterceptor(
    request: true,
    responseBody: true,
  ));
  return dio;
});
