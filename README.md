# Weather BLoC app

A Flutter project representing the implementation of the BLoC pattern, using the example of an application providing the weather for selected locations.

Full stack: BLoC, GoRouter, GetIt, Injectable, Mockito, Sembast.

<img src="/demo.gif" width="240" height="480"/>

## Getting Started

App uses [AccuWeather API][1] to fetch weather conditions data.

Please provide your API key to take advantage of the full functionality. If you not provide it, dummy data will be used.

API key must be provided as dart define like presented below:
`flutter run --dart-define=WEATHER_API_KEY={YOUR_API_KEY}`

You can easily generate free API key from [AccuWeather developer website][2]. It has a limit of 50 hits per day.

## Environment

Project developed and ran on Flutter ver 3.13.6 (Dart 3.1.3)

[1]: https://developer.accuweather.com/apis
[2]: https://developer.accuweather.com/
