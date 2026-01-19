import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/main.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/providers/movie_provider.dart';

void main() {
  testWidgets('Displays ListView of movies', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => MovieProvider(),
        child: const MyApp(),
      ),
    );

    // Wait for the movies to be loaded
    await tester.pumpAndSettle();

    // Verify that the ListView is displayed
    expect(find.byType(ListView), findsOneWidget);
  });
}
