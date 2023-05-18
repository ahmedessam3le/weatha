import 'package:weatha/home/data/models/current_model.dart';
import 'package:weatha/home/data/models/daily_model.dart';
import 'package:weatha/home/data/models/hourly_model.dart';
import 'package:weatha/home/domain/entities/forecast.dart';

class ForecastModel extends Forecast {
  ForecastModel({
    required super.latitude,
    required super.longitude,
    required super.timeZone,
    required super.current,
    required super.hourly,
    required super.daily,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      latitude: json['lat'],
      longitude: json['lon'],
      timeZone: json['timezone'],
      current: CurrentModel.fromJson(json['current']),
      hourly: List<HourlyModel>.from(
        json['hourly'].map(
          (element) => HourlyModel.fromJson(element),
        ),
      ),
      daily: List<DailyModel>.from(
        json['daily'].map(
          (element) => DailyModel.fromJson(element),
        ),
      ),
    );
  }
}
