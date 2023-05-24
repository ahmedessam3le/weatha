import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatha/core/network/dio_helper.dart';

import '../models/forecast_model.dart';
import '../models/user_location_model.dart';

abstract class WeatherRemoteDataSource {
  Future<ForecastModel> getWeather({
    required double latitude,
    required double longitude,
    required String lang,
    required String appId,
  });
  Future<UserLocationModel> getUserLocation({
    required double latitude,
    required double longitude,
    required int limit,
    required String lang,
    required String appId,
  });
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final DioHelper dioHelper;

  WeatherRemoteDataSourceImpl({required this.dioHelper});
  @override
  Future<UserLocationModel> getUserLocation({
    required double latitude,
    required double longitude,
    required int limit,
    required String lang,
    required String appId,
  }) async {
    try {
      final Response response = await dioHelper.get(
        '/geo/1.0/reverse',
        json: {
          'lat': latitude,
          'lon': longitude,
          'limit': limit,
          'lang': lang,
          'appid': appId,
        },
      );
      return (response.data as List)
          .map((e) => UserLocationModel.fromJson(e))
          .toList()[0];
    } catch (error) {
      log('----------------- getUserLocation --------------- \n${error.toString()}');
      rethrow;
    }
  }

  @override
  Future<ForecastModel> getWeather({
    required double latitude,
    required double longitude,
    required String lang,
    required String appId,
  }) async {
    try {
      final Response response = await dioHelper.get(
        '/data/2.5/onecall',
        json: {
          'lat': latitude,
          'lon': longitude,
          'lang': lang,
          'appid': appId,
        },
      );
      return ForecastModel.fromJson(response.data);
    } catch (error) {
      log('----------------- getWeather --------------- \n${error.toString()}');
      rethrow;
    }
  }
}
