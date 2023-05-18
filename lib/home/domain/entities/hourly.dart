import 'package:weatha/home/domain/entities/weather.dart';

class Hourly {
  final int dateTime;
  final double temperature;
  final List<Weather> weather;

  Hourly({
    required this.dateTime,
    required this.temperature,
    required this.weather,
  });
}
