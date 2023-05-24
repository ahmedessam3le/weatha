import 'package:weatha/home/domain/entities/weather.dart';

class Current {
  final int dateTime;
  final int sunrise;
  final int sunset;
  final double temperature;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final num uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final double windGust;
  final List<Weather> weather;

  Current({
    required this.dateTime,
    required this.sunrise,
    required this.sunset,
    required this.temperature,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
  });
}
