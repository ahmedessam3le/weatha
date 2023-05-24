import 'package:weatha/home/domain/entities/user_location.dart';

import '../entities/forecast.dart';

abstract class WeatherRepository {
  Future<Forecast> getWeather({
    required double latitude,
    required double longitude,
    required String lang,
    required String appId,
  });
  Future<UserLocation?> getUserLocation({
    double? latitude,
    double? longitude,
    int? limit,
    String? lang,
    String? appId,
  });
}
