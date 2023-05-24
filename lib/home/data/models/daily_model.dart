import 'package:weatha/home/data/models/temperature_model.dart';
import 'package:weatha/home/data/models/weather_model.dart';

import '../../domain/entities/daily.dart';

class DailyModel extends Daily {
  TemperatureModel? temperatureModel;
  List<WeatherModel>? weatherModel;
  DailyModel({
    required super.dateTime,
    required this.temperatureModel,
    required this.weatherModel,
  }) : super(temperature: temperatureModel!, weather: weatherModel!);

  factory DailyModel.fromJson(Map<String, dynamic> json) {
    return DailyModel(
      dateTime: json['dt'] ?? 0,
      temperatureModel: TemperatureModel.fromJson(json['temp']),
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
    data['temp'] = temperatureModel!.toJson();
    data['weather'] = weatherModel!.map((v) => v.toJson()).toList();
    return data;
  }
}
