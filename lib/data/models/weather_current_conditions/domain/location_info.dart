import 'package:weather_bloc_app/data/models/weather_current_conditions/cache/location_info_cache.dart';

class LocationInfo {
  final String key;
  final String city;
  final String area;
  final String country;

  LocationInfo({
    required this.key,
    required this.city,
    required this.area,
    required this.country,
  });

  factory LocationInfo.fromDbModel(LocationInfoCache dbModel) => LocationInfo(
        key: dbModel.key,
        city: dbModel.city,
        area: dbModel.area,
        country: dbModel.country,
      );

  LocationInfoCache toDbModel() => LocationInfoCache(
        key: key,
        city: city,
        area: area,
        country: country,
      );
}
