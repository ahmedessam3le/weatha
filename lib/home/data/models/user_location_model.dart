import 'package:weatha/home/data/models/local_names_model.dart';
import 'package:weatha/home/domain/entities/user_location.dart';

class UserLocationModel extends UserLocation {
  UserLocationModel({
    required super.name,
    required super.country,
    required super.state,
    required super.latitude,
    required super.longitude,
    required super.localNames,
  });

  factory UserLocationModel.fromJson(Map<String, dynamic> json) {
    return UserLocationModel(
      name: json['name'],
      country: json['country'],
      state: json['state'],
      latitude: json['lat'],
      longitude: json['lon'],
      localNames: LocalNamesModel.fromJson(json['local_names']),
    );
  }
}
