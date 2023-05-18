import 'package:weatha/home/domain/entities/weather.dart';

class WeatherModel extends Weather {
  WeatherModel({
    required super.main,
    required super.description,
    required super.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      main: json['main'],
      description: json['description'],
      icon: json['icons'],
    );
  }
}
