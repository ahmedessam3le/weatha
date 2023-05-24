import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatha/core/const/app_values.dart';

abstract class WeatherLocalDataSource {
  Future<bool> setCurrentLocation(String location);
  Future<bool> setLastForecast(String forecast);
  Future<bool> clearData();
  String? getCurrentLocation();
  String? getLastForecast();
}

class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  final SharedPreferences sharedPreferences;

  WeatherLocalDataSourceImpl({required this.sharedPreferences});

  @override
  String getCurrentLocation() {
    return sharedPreferences.getString(AppValues.currentLocationKey)!;
  }

  @override
  String getLastForecast() {
    return sharedPreferences.getString(AppValues.lastForecastKey)!;
  }

  @override
  Future<bool> setCurrentLocation(String location) async {
    return await sharedPreferences.setString(
        AppValues.currentLocationKey, location);
  }

  @override
  Future<bool> setLastForecast(String forecast) async {
    return await sharedPreferences.setString(
        AppValues.lastForecastKey, forecast);
  }

  @override
  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }
}
