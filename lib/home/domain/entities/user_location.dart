import 'package:weatha/home/domain/entities/local_names.dart';

class UserLocation {
  final String name, country, city;
  final double latitude, longitude;
  final LocalNames localNames;

  UserLocation({
    required this.name,
    required this.country,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.localNames,
  });
}
