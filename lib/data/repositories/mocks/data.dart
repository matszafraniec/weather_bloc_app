import 'package:weather_bloc_app/data/models/weather_forecast/domain/weather_forecast.dart';

import '../../models/location_autocomplete/domain/location_autocomplete.dart';
import '../../models/weather_current_conditions/domain/weather_current_conditions.dart';

class MockedWeatherRepositoryData {
  List<LocationAutocomplete> get locations => [
        LocationAutocomplete(
          key: '1',
          name: 'Warsaw (mocked)',
          country: 'Poland',
          area: 'Mazovia',
        ),
        LocationAutocomplete(
          key: '2',
          name: 'Gdańsk (mocked)',
          country: 'Poland',
          area: 'Pomerania',
        ),
        LocationAutocomplete(
          key: '3',
          name: 'New York (mocked)',
          country: 'United States',
          area: 'New York',
        ),
        LocationAutocomplete(
          key: '4',
          name: 'Berlin (mocked)',
          country: 'Germany',
          area: 'Brandenburg',
        ),
        LocationAutocomplete(
          key: '5',
          name: 'Stockholm (mocked)',
          country: 'Sweden',
          area: 'Stockholm County',
        ),
        LocationAutocomplete(
          key: '6',
          name: 'Helsinki (mocked)',
          country: 'Findland',
          area: 'Uusimaa',
        ),
        LocationAutocomplete(
          key: '7',
          name: 'Vilnius (mocked)',
          country: 'Lithuania',
          area: 'Vilnius County',
        ),
        LocationAutocomplete(
          key: '8',
          name: 'Tallin (mocked)',
          country: 'Estonia',
          area: 'Harju',
        ),
      ];

  WeatherCurrentConditions get currentWeatherConditions =>
      WeatherCurrentConditions(
        icon: 3,
        regularTemperature: 30,
        realFeelTemperature: 33,
        windSpeed: 15.5,
        uvIndexText: 'Moderate',
      );

  List<WeatherForecast> get weatherForecast => [
        WeatherForecast(
          icon: 3,
          temperature: 20.1,
          windSpeed: 130,
        ),
        WeatherForecast(
          icon: 2,
          temperature: 25.1,
          windSpeed: 85,
        ),
        WeatherForecast(
          icon: 10,
          temperature: 13.1,
          windSpeed: 80,
        ),
        WeatherForecast(
          icon: 3,
          temperature: 14.1,
          windSpeed: 15,
        ),
        WeatherForecast(
          icon: 1,
          temperature: 15.1,
          windSpeed: 13,
        ),
      ];
}
