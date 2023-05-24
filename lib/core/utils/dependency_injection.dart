import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatha/core/network/dio_helper.dart';
import 'package:weatha/home/data/data_sources/weather_local_data_source.dart';
import 'package:weatha/home/domain/repositories/weather_repository.dart';
import 'package:weatha/splash/presentation/view_model/splash_view_model.dart';

import '../../home/data/data_sources/weather_remote_data_source.dart';
import '../../home/data/repositories/weather_repository_impl.dart';
import '../../home/presentation/view_model/home_view_model.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // 1 - Features
  // a) ViewModels
  serviceLocator.registerFactory(
    () => SplashViewModel(
      weatherRepository: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => HomeViewModel(
      weatherLocalDataSource: serviceLocator(),
    ),
  );

  // b) Use Cases

  // c) Repositories
  serviceLocator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      weatherLocalDataSource: serviceLocator(),
      weatherRemoteDataSource: serviceLocator(),
    ),
  );

  // d) Data Sources
  serviceLocator.registerLazySingleton<WeatherLocalDataSource>(
    () => WeatherLocalDataSourceImpl(
      sharedPreferences: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(
      dioHelper: serviceLocator(),
    ),
  );

  // 2 - Core

  // 3 - External

  final sharedPrefs = await SharedPreferences.getInstance();

  serviceLocator.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  serviceLocator.registerLazySingleton<DioHelper>(() => DioHelper());
  serviceLocator.registerFactory<Connectivity>(() => Connectivity());
}
