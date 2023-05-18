import 'package:weatha/home/domain/entities/temperature.dart';

class TemperatureModel extends Temperature {
  TemperatureModel({
    required super.minimum,
    required super.maximum,
    required super.day,
    required super.morning,
    required super.evening,
    required super.night,
  });

  factory TemperatureModel.fromJson(Map<String, dynamic> json) {
    return TemperatureModel(
      minimum: json['min'],
      maximum: json['max'],
      day: json['day'],
      morning: json['morn'],
      evening: json['eve'],
      night: json['night'],
    );
  }
}
