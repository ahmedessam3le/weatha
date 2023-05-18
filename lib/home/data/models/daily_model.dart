import 'package:weatha/home/data/models/temperature_model.dart';
import 'package:weatha/home/data/models/weather_model.dart';

import '../../domain/entities/daily.dart';

class DailyModel extends Daily {
  DailyModel({
    required super.dateTime,
    required super.temperature,
    required super.weather,
  });

  factory DailyModel.fromJson(Map<String, dynamic> json) {
    return DailyModel(
      dateTime: json['dt'],
      temperature: TemperatureModel.fromJson(json['temp']),
      weather: List<WeatherModel>.from(
        json['weather'].map(
          (element) => WeatherModel.fromJson(element),
        ),
      ),
    );
  }
}
