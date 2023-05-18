import 'package:weatha/home/domain/entities/temperature.dart';
import 'package:weatha/home/domain/entities/weather.dart';

class Daily {
  final int dateTime;
  final Temperature temperature;
  final List<Weather> weather;

  Daily({
    required this.dateTime,
    required this.temperature,
    required this.weather,
  });
}
