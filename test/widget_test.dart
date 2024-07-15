import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart' as http;
import 'package:you_app_test/main.dart';
import 'package:you_app_test/repositories/auth_repository.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final authenticationRepository = AuthenticationRepository(httpClient: http.Client());

    // Build our app and trigger a frame.
    await tester.pumpWidget(App(authenticationRepository: authenticationRepository));

    // Verify that our counter starts at 0.
    expect(find.text('Login'), findsOneWidget);
  });
}
