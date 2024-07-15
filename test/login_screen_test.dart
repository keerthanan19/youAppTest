import 'package:flutter_test/flutter_test.dart';
import 'package:you_app_test/screens/login_screen.dart';

void main() {
  testWidgets('LoginScreen has a title and message', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(LoginScreen());

    // Verify that our counter starts at 0.
    expect(find.text('Login'), findsOneWidget);
  });
}
