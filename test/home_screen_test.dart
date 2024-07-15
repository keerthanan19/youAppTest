import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:you_app_test/home_screen.dart';

void main() {
  testWidgets('HomeScreen renders correctly', (WidgetTester tester) async {
    // Build the HomeScreen widget
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    // Verify that the widget renders correctly
    expect(find.text('Welcome'), findsOneWidget);
    expect(find.text('User ID:'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
