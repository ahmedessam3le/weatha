import 'package:weatha/home/data/models/weather_model.dart';
import 'package:weatha/home/domain/entities/current.dart';

class CurrentModel extends Current {
  CurrentModel({
    required super.dateTime,
    required super.sunrise,
    required super.sunset,
    required super.temperature,
    required super.feelsLike,
    required super.pressure,
    required super.humidity,
    required super.dewPoint,
    required super.uvi,
    required super.clouds,
    required super.visibility,
    required super.windSpeed,
    required super.windDeg,
    required super.windGust,
    required super.weather,
  });

  factory CurrentModel.fromJson(Map<String, dynamic> json) {
    return CurrentModel(
      dateTime: json['dt'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      temperature: json['temp'],
      feelsLike: json['feels_like'],
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: json['dew_point'],
      uvi: json['uvi'],
      clouds: json['clouds'],
      visibility: json['visibility'],
      windSpeed: json['wind_speed'],
      windDeg: json['wind_deg'],
      windGust: json['wind_gust'],
      weather: List<WeatherModel>.from(
        json['weather'].map(
          (element) => WeatherModel.fromJson(element),
        ),
      ),
    );
  }
}
