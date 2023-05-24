import 'package:weatha/home/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required super.main,
    required super.description,
    required super.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      main: json['main'] ?? '',
      description: json['description'] ?? '',
      icon: json['icon'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}
