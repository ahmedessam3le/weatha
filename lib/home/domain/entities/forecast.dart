import 'package:weatha/home/domain/entities/current.dart';
import 'package:weatha/home/domain/entities/daily.dart';
import 'package:weatha/home/domain/entities/hourly.dart';

class Forecast {
  final double latitude, longitude;
  final String timeZone;
  final Current current;
  final List<Hourly> hourly;
  final List<Daily> daily;

  Forecast({
    required this.latitude,
    required this.longitude,
    required this.timeZone,
    required this.current,
    required this.hourly,
    required this.daily,
  });
}
