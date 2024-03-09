import 'package:sembast/timestamp.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/cache/location_info_cache.dart';

class WeatherConditionsHistoryCache {
  final int id;
  final int icon;
  final double regularTemperature;
  final double realFeelTemperature;
  final double windSpeed;
  final String uvIndexText;
  final LocationInfoCache locationInfo;
  final Timestamp lastSeenAt;

  WeatherConditionsHistoryCache({
    required this.id,
    required this.icon,
    required this.regularTemperature,
    required this.realFeelTemperature,
    required this.windSpeed,
    required this.uvIndexText,
    required this.locationInfo,
    required this.lastSeenAt,
  });

  // factory WeatherConditionsHistoryCache.fromCurrentConditionsDomain(
  //         WeatherCurrentConditions domain) =>
  //     WeatherConditionsHistoryCache(
  //       id: domain.,
  //       icon: domain.icon,
  //       regularTemperature: domain.regularTemperature,
  //       realFeelTemperature: domain.realFeelTemperature,
  //       windSpeed: domain.windSpeed,
  //       uvIndexText:domain.uvIndexText,
  //       locationInfo: LocationInfoCache.fromDomain(domain.locationInfo),
  //       lastSeenAt: map['lastSeenAt'] as Timestamp,
  //     );

  factory WeatherConditionsHistoryCache.fromMap(Map<String, dynamic> map) =>
      WeatherConditionsHistoryCache(
        id: map['id'] as int,
        icon: map['icon'] as int,
        regularTemperature: map['regularTemperature'] as double,
        realFeelTemperature: map['realFeelTemperature'] as double,
        windSpeed: map['windSpeed'] as double,
        uvIndexText: map['uvIndexText'] as String,
        locationInfo: LocationInfoCache.fromMap(
          map['locationInfo'],
        ),
        lastSeenAt: map['lastSeenAt'] as Timestamp,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'icon': icon,
        'regularTemperature': regularTemperature,
        'realFeelTemperature': realFeelTemperature,
        'windSpeed': windSpeed,
        'uvIndexText': uvIndexText,
        'locationInfo': locationInfo.toMap(),
        'lastSeenAt': lastSeenAt,
      };
}
