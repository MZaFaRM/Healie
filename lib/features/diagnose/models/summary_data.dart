import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_data.freezed.dart';
part 'summary_data.g.dart';

@freezed
class SummaryData with _$SummaryData {
  const factory SummaryData({
    @JsonKey(name: 'blood_pressure') required String bloodPressure,
    @JsonKey(name: 'total_cholesterol') required int totalCholesterol,
    @JsonKey(name: 'blood_sugar') required int bloodSugar,
    @JsonKey(name: 'bmi') required double bmi,
    @JsonKey(name: 'resting_heart_rate') required int restingHeartRate,
    @JsonKey(name: 'oxygen_saturation') required double oxygenSaturation,
    @JsonKey(name: 'waist_circumference') required double waistCircumference,
    @JsonKey(name: 'body_fat_percentage') required double bodyFatPercentage,
    @JsonKey(name: 'muscle_mass') required double muscleMass,
    @JsonKey(name: 'bone_density') required double boneDensity,
  }) = _SummaryData;

  factory SummaryData.fromJson(Map<String, dynamic> json) =>
      _$SummaryDataFromJson(json);
}
