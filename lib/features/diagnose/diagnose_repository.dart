import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:healie/core/providers.dart';
import 'package:healie/features/diagnose/models/summary_data.dart';
import 'package:healie/utils/failure.dart';
import 'package:healie/utils/typedefs.dart';

final reportRepositoryProvider = Provider((ref) {
  return ReportRepository(dio: ref.read(dioProvider));
});

class ReportRepository {
  ReportRepository({required Dio dio}) : _dio = dio;

  final Dio _dio;

  FutureEither<String> getSummary(SummaryData data) async {
    try {
      debugPrint("DATA: ${data.toJson()}");
      final res = await _dio.post(
        '/summarize/',
        // data: data.toJson(),
        data: {
          "blood_pressure": "120/80",
          "total_cholesterol": 200,
          "blood_sugar": 90,
          "bmi": 22.5,
          "resting_heart_rate": 70,
          "oxygen_saturation": 98.5,
          "waist_circumference": 80.0,
          "body_fat_percentage": 18.0,
          "muscle_mass": 55.0,
          "bone_density": 2.1
        },
      );
      return right(res.data['response']['openai']['generated_text'] as String);
    } on DioException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
