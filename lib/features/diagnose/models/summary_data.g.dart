// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SummaryDataImpl _$$SummaryDataImplFromJson(Map<String, dynamic> json) =>
    _$SummaryDataImpl(
      bloodPressure: json['blood_pressure'] as String,
      totalCholesterol: json['total_cholesterol'] as int,
      bloodSugar: json['blood_sugar'] as int,
      bmi: (json['bmi'] as num).toDouble(),
      restingHeartRate: json['resting_heart_rate'] as int,
      oxygenSaturation: (json['oxygen_saturation'] as num).toDouble(),
      waistCircumference: (json['waist_circumference'] as num).toDouble(),
      bodyFatPercentage: (json['body_fat_percentage'] as num).toDouble(),
      muscleMass: (json['muscle_mass'] as num).toDouble(),
      boneDensity: (json['bone_density'] as num).toDouble(),
    );

Map<String, dynamic> _$$SummaryDataImplToJson(_$SummaryDataImpl instance) =>
    <String, dynamic>{
      'blood_pressure': instance.bloodPressure,
      'total_cholesterol': instance.totalCholesterol,
      'blood_sugar': instance.bloodSugar,
      'bmi': instance.bmi,
      'resting_heart_rate': instance.restingHeartRate,
      'oxygen_saturation': instance.oxygenSaturation,
      'waist_circumference': instance.waistCircumference,
      'body_fat_percentage': instance.bodyFatPercentage,
      'muscle_mass': instance.muscleMass,
      'bone_density': instance.boneDensity,
    };
