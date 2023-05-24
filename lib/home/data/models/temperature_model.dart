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
      minimum: json['min'] ?? 0,
      maximum: json['max'] ?? 0,
      day: json['day'] ?? 0,
      morning: json['morn'] ?? 0,
      evening: json['eve'] ?? 0,
      night: json['night'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['min'] = minimum;
    data['max'] = maximum;
    data['night'] = night;
    data['eve'] = evening;
    data['morn'] = morning;
    return data;
  }
}
