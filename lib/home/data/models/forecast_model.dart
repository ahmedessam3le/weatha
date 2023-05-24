import 'package:weatha/home/data/models/current_model.dart';
import 'package:weatha/home/data/models/daily_model.dart';
import 'package:weatha/home/data/models/hourly_model.dart';
import 'package:weatha/home/domain/entities/forecast.dart';

class ForecastModel extends Forecast {
  CurrentModel? currentModel;
  List<HourlyModel>? hourlyModel;
  List<DailyModel>? dailyModel;

  ForecastModel({
    required super.latitude,
    required super.longitude,
    required super.timeZone,
    required this.currentModel,
    required this.hourlyModel,
    required this.dailyModel,
  }) : super(current: currentModel!, hourly: hourlyModel!, daily: dailyModel!);

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      latitude: json['lat'] ?? 0.0,
      longitude: json['lon'] ?? 0.0,
      timeZone: json['timezone'] ?? 0,
      currentModel: CurrentModel.fromJson(json['current']),
      hourlyModel: List<HourlyModel>.from(
        json['hourly'].map(
          (element) => HourlyModel.fromJson(element),
        ),
      ),
      dailyModel: List<DailyModel>.from(
        json['daily'].map(
          (element) => DailyModel.fromJson(element),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = latitude;
    data['lon'] = longitude;
    data['timezone'] = timeZone;
    data['current'] = currentModel!.toJson();
    data['hourly'] = hourlyModel!.map((v) => v.toJson()).toList();
    data['daily'] = dailyModel!.map((v) => v.toJson()).toList();
    return data;
  }
}
