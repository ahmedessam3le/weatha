import 'package:weatha/home/data/models/weather_model.dart';
import 'package:weatha/home/domain/entities/current.dart';

class CurrentModel extends Current {
  List<WeatherModel>? weatherModel;
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
    required this.weatherModel,
  }) : super(weather: weatherModel!);

  factory CurrentModel.fromJson(Map<String, dynamic> json) {
    return CurrentModel(
      dateTime: json['dt'] ?? 0,
      sunrise: json['sunrise'] ?? 0,
      sunset: json['sunset'] ?? 0,
      temperature: json['temp'] ?? 0.0,
      feelsLike: json['feels_like'] ?? 0.0,
      pressure: json['pressure'] ?? 0,
      humidity: json['humidity'] ?? 0,
      dewPoint: json['dew_point'] ?? 0.0,
      uvi: json['uvi'] ?? 0,
      clouds: json['clouds'] ?? 0,
      visibility: json['visibility'] ?? 0,
      windSpeed: json['wind_speed'] ?? 0.0,
      windDeg: json['wind_deg'] ?? 0,
      windGust: json['wind_gust'] ?? 0.0,
      weatherModel: List<WeatherModel>.from(
        json['weather'].map(
          (element) => WeatherModel.fromJson(element),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dateTime;
    data['temp'] = temperature;
    data['weather'] = weatherModel!.map((v) => v.toJson()).toList();
    return data;
  }
}
