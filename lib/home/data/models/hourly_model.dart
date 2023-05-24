import 'package:weatha/home/data/models/weather_model.dart';
import 'package:weatha/home/domain/entities/hourly.dart';

class HourlyModel extends Hourly {
  List<WeatherModel>? weatherModel;
  HourlyModel({
    required super.dateTime,
    required super.temperature,
    required this.weatherModel,
  }) : super(weather: weatherModel!);

  factory HourlyModel.fromJson(Map<String, dynamic> json) {
    return HourlyModel(
      dateTime: json['dt'] ?? 0,
      temperature: json['temp'] ?? 0,
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
