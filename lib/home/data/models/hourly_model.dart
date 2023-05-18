import 'package:weatha/home/data/models/weather_model.dart';
import 'package:weatha/home/domain/entities/hourly.dart';

class HourlyModel extends Hourly {
  HourlyModel({
    required super.dateTime,
    required super.temperature,
    required super.weather,
  });

  factory HourlyModel.fromJson(Map<String, dynamic> json) {
    return HourlyModel(
      dateTime: json['dt'],
      temperature: json['temp'],
      weather: List<WeatherModel>.from(
        json['weather'].map(
          (element) => WeatherModel.fromJson(element),
        ),
      ),
    );
  }
}
