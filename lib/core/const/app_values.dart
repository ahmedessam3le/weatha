import 'package:flutter/material.dart';
import 'package:weatha/home/domain/entities/default_user_location.dart';

class AppValues {
  /// base url
  static const String baseUrl = 'https://api.openweathermap.org';

  /// img url
  static const String imgUrl = 'http://openweathermap.org/img/w/';

  /// png
  static const String png = '.png';

  /// en lang code
  static const String langCodeEn = 'en';

  /// uk lang code
  static const String langCodeAr = 'ar';

  /// basic lang code
  static const String langCodeBasic = langCodeEn;

  /// symbol Celsius '°C'
  static const String symbolCelsius = '°C';

  /// Locale uk
  static const Locale localeAR = Locale('ar');

  /// Locale en
  static const Locale localeEN = Locale('en');

  /// Supported locales (en, de)
  static const List<Locale> supportedLocales = <Locale>[
    localeAR,
    localeEN,
  ];

  /// locales path
  static const String localesPath = 'assets/translations';

  /// default location
  static final DefaultUserLocation defaultLocation = DefaultUserLocation();

  static const String currentLocationKey = 'currentLocationKey';

  static const String lastForecastKey = 'lastForecastKey';
}
