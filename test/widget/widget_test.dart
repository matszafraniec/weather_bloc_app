import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_bloc_app/data/common/environment.dart';
import 'package:weather_bloc_app/injection/injection.dart';
import 'package:weather_bloc_app/presentation/common/app.dart';

void main() {
  setUp(() => setupDependencies(mockEnv));

  testWidgets(
    'Home screen smoke test',
    (WidgetTester tester) async {
      await tester.pumpWidget(const App());

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Favorites'), findsOneWidget);
      expect(find.text('History'), findsOneWidget);
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsOneWidget);
      expect(find.byIcon(Icons.history), findsOneWidget);
      expect(find.text('Input city name'), findsOneWidget);
    },
  );
}
