import 'package:sembast/timestamp.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/cache/location_info_cache.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/cache/weather_conditions_history_cache.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/location_info.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/weather_current_conditions.dart';

class WeatherConditionsHistory {
  final int id;
  final DateTime lastSeenAt;
  final WeatherCurrentConditions conditions;

  WeatherConditionsHistory({
    required this.id,
    required this.lastSeenAt,
    required this.conditions,
  });

  factory WeatherConditionsHistory.fromCurrentConditions(
    WeatherCurrentConditions currentConditions,
  ) {
    final now = DateTime.now();

    return WeatherConditionsHistory(
      id: now.millisecondsSinceEpoch,
      lastSeenAt: now,
      conditions: currentConditions,
    );
  }

  factory WeatherConditionsHistory.fromDbModel(
    WeatherConditionsHistoryCache dbModel,
  ) =>
      WeatherConditionsHistory(
        id: dbModel.id,
        lastSeenAt: dbModel.lastSeenAt.toDateTime(),
        conditions: WeatherCurrentConditions(
          icon: dbModel.icon,
          regularTemperature: dbModel.regularTemperature,
          realFeelTemperature: dbModel.realFeelTemperature,
          windSpeed: dbModel.windSpeed,
          uvIndexText: dbModel.uvIndexText,
        )..locationInfo = LocationInfo.fromDbModel(
            dbModel.locationInfo,
          ),
      );

  WeatherConditionsHistoryCache toDbModel() => WeatherConditionsHistoryCache(
        id: id,
        lastSeenAt: Timestamp.fromDateTime(lastSeenAt),
        icon: conditions.icon,
        regularTemperature: conditions.regularTemperature,
        realFeelTemperature: conditions.realFeelTemperature,
        windSpeed: conditions.windSpeed,
        uvIndexText: conditions.uvIndexText,
        locationInfo: LocationInfoCache.fromDomain(conditions.locationInfo),
      );
}
