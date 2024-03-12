import 'package:connectivity_plus/connectivity_plus.dart';

extension DateUtils on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return tomorrow.day == day &&
        tomorrow.month == month &&
        tomorrow.year == year;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }
}

extension ConnectivityResultExtensions on ConnectivityResult {
  bool get isDisconnected =>
      this == ConnectivityResult.none || this == ConnectivityResult.bluetooth;

  bool get isConnected => !isDisconnected;
}
