import 'dart:convert';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weatha/core/utils/app_utils.dart';
import 'package:weatha/home/data/data_sources/weather_local_data_source.dart';
import 'package:weatha/home/data/data_sources/weather_remote_data_source.dart';
import 'package:weatha/home/domain/repositories/weather_repository.dart';

import '../models/forecast_model.dart';
import '../models/user_location_model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherLocalDataSource weatherLocalDataSource;
  final WeatherRemoteDataSource weatherRemoteDataSource;

  WeatherRepositoryImpl({
    required this.weatherLocalDataSource,
    required this.weatherRemoteDataSource,
  });

  @override
  Future<UserLocationModel?> getUserLocation({
    double? latitude,
    double? longitude,
    int? limit,
    String? lang,
    String? appId,
  }) async {
    UserLocationModel? location;
    try {
      bool enabled;

      enabled = await Permission.location.request().isGranted;

      if (enabled) {
        final Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        final double lat = position.latitude;
        final double lon = position.longitude;
        location = await weatherRemoteDataSource.getUserLocation(
          latitude: lat,
          longitude: lon,
          lang: AppUtils.getLanguageCode(),
          limit: 1,
          appId: appId!,
        );
        await weatherLocalDataSource
            .setCurrentLocation(jsonEncode(location.toJson()));

        return location;
      } else {
        if (weatherLocalDataSource.getCurrentLocation() != null) {
          return UserLocationModel.fromJson(
              jsonDecode(weatherLocalDataSource.getCurrentLocation()!));
        } else {
          return null;
        }
      }
    } catch (e) {
      log('--------------- getUserLocation ERROR------------\n${e.toString()}');
    }
    return location;
  }

  @override
  Future<ForecastModel> getWeather({
    required double latitude,
    required double longitude,
    required String lang,
    required String appId,
  }) async {
    final forecast = await weatherRemoteDataSource.getWeather(
      latitude: latitude,
      longitude: longitude,
      lang: lang,
      appId: appId,
    );
    await weatherLocalDataSource.setLastForecast(jsonEncode(forecast.toJson()));

    return forecast;
  }
}
