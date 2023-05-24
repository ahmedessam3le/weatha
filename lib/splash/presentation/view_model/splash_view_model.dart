import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:weatha/core/base/base_view_model.dart';
import 'package:weatha/core/utils/dependency_injection.dart' as di;
import 'package:weatha/home/domain/entities/default_user_location.dart';
import 'package:weatha/home/domain/entities/user_location.dart';
import 'package:weatha/home/domain/repositories/weather_repository.dart';

import '../../../core/const/api_key.dart';
import '../../../core/utils/app_utils.dart';

class SplashViewModel extends BaseViewModel {
  final WeatherRepository weatherRepository;

  SplashViewModel({required this.weatherRepository});

  UserLocation? location;

  void init(void Function() goRouter) async {
    if (await di.serviceLocator<Connectivity>().checkConnectivity() ==
            ConnectivityResult.mobile ||
        await di.serviceLocator<Connectivity>().checkConnectivity() ==
            ConnectivityResult.wifi) {
      location = (await weatherRepository.getUserLocation(
        appId: apiKey,
      ));

      if (location != null) {
        final forecast = await weatherRepository.getWeather(
          latitude: location!.latitude,
          longitude: location!.longitude,
          lang: AppUtils.getLanguageCode(),
          appId: apiKey,
        );
      } else {
        final forecast = await weatherRepository.getWeather(
          latitude: DefaultUserLocation().latitude,
          longitude: DefaultUserLocation().longitude,
          lang: AppUtils.getLanguageCode(),
          appId: apiKey,
        );
      }
    } else {
      Future.delayed(const Duration(milliseconds: 300));
    }
    goRouter();
  }
}
