import '../domain/location_info.dart';

class LocationInfoCache {
  final String key;
  final String city;
  final String area;
  final String country;

  LocationInfoCache({
    required this.key,
    required this.city,
    required this.area,
    required this.country,
  });

  factory LocationInfoCache.fromDomain(LocationInfo domain) =>
      LocationInfoCache(
        key: domain.key,
        city: domain.city,
        area: domain.area,
        country: domain.country,
      );

  factory LocationInfoCache.fromMap(Map<String, dynamic> map) =>
      LocationInfoCache(
        key: map['key'],
        city: map['city'],
        area: map['area'],
        country: map['country'],
      );

  Map<String, dynamic> toMap() => {
        'key': key,
        'city': city,
        'area': area,
        'country': country,
      };
}
