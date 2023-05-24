import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weatha/core/const/app_strings.dart';
import 'package:weatha/core/const/app_values.dart';
import 'package:weatha/core/utils/app_router.dart';
import 'package:weatha/home/data/data_sources/weather_local_data_source.dart';
import 'package:weatha/home/data/models/forecast_model.dart';
import 'package:weatha/home/data/models/user_location_model.dart';
import 'package:weatha/home/domain/entities/forecast.dart';

import '../../../core/base/base_view_model.dart';
import '../../../core/style/app_widgets.dart';

class HomeViewModel extends BaseViewModel {
  final WeatherLocalDataSource weatherLocalDataSource;

  HomeViewModel({required this.weatherLocalDataSource});

  late List<PopUpModel> popUpModels;
  Forecast? forecast;
  dynamic location;
  bool _isScreenError = false;
  bool _isScreenLoading = false;
  int _viewIndex = 0;

  bool get isScreenError => _isScreenError;

  set isScreenError(bool value) {
    _isScreenError = value;
    notifyListeners();
  }

  bool get isScreenLoading => _isScreenLoading;

  set isScreenLoading(bool value) {
    _isScreenLoading = value;
    notifyListeners();
  }

  int get viewIndex => _viewIndex;

  set viewIndex(int value) {
    _viewIndex = value;
    notifyListeners();
  }

  Future<void> refreshScreen(BuildContext context) async =>
      context.go(AppRoutes.splashRoute);

  void hourlyForecast() => viewIndex = 0;
  void dailyForecast() => viewIndex = 1;

  void getLastForecast() {
    String? response = weatherLocalDataSource.getLastForecast();
    if (response != null) {
      forecast = ForecastModel.fromJson(jsonDecode(response));
    } else {
      isScreenError = true;
    }
  }

  void getUserLocation() {
    String? response = weatherLocalDataSource.getCurrentLocation();
    if (response != null) {
      location = UserLocationModel.fromJson(jsonDecode(response));
    } else {
      location = AppValues.defaultLocation;
    }
  }

  void widgetInit() {
    popUpModels = [
      PopUpModel(title: AppStrings.hourlyWeather.tr(), func: hourlyForecast),
      PopUpModel(title: AppStrings.weatherByDay.tr(), func: dailyForecast),
    ];
  }

  Future<void> init() async {
    setBusy(true);
    widgetInit();
    try {
      getUserLocation();
      getLastForecast();
    } catch (error) {
      log('---------------- Home init ERROR ----------- \n${error.toString()}');
      isScreenError = true;
    }
    setBusy(false);
  }
}
