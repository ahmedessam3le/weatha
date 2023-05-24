import 'package:weatha/home/data/models/local_names_model.dart';
import 'package:weatha/home/domain/entities/user_location.dart';

class UserLocationModel extends UserLocation {
  LocalNamesModel? localNamesModel;
  UserLocationModel({
    required super.name,
    required super.country,
    required super.city,
    required super.latitude,
    required super.longitude,
    required this.localNamesModel,
  }) : super(localNames: localNamesModel!);

  factory UserLocationModel.fromJson(Map<String, dynamic> json) {
    return UserLocationModel(
      name: json['name'] ?? '',
      country: json['country'] ?? '',
      city: json['state'] ?? '',
      latitude: json['lat'] ?? 0.0,
      longitude: json['lon'] ?? 0.0,
      localNamesModel: LocalNamesModel.fromJson(json['local_names']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['local_names'] = localNamesModel?.toJson();
    data['lat'] = latitude;
    data['lon'] = longitude;
    data['country'] = country;
    data['state'] = city;
    return data;
  }
}
