import 'package:weatha/home/domain/entities/local_names.dart';

class UserLocation {
  final String name, country, state;
  final double latitude, longitude;
  final LocalNames localNames;

  UserLocation({
    required this.name,
    required this.country,
    required this.state,
    required this.latitude,
    required this.longitude,
    required this.localNames,
  });
}
