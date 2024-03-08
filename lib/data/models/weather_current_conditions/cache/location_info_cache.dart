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
