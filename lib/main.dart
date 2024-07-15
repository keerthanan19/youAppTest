import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:you_app_test/blocs/auth_bloc/auth_bloc.dart';
import 'package:you_app_test/blocs/auth_bloc/auth_event.dart';
import 'package:you_app_test/home_screen.dart';
import 'package:you_app_test/repositories/auth_repository.dart';
import 'package:http/http.dart' as http;


void main() {
  final AuthenticationRepository authenticationRepository = AuthenticationRepository(httpClient: http.Client());
  runApp(App(authenticationRepository: authenticationRepository));
}

class App extends StatelessWidget {
  final AuthenticationRepository authenticationRepository;

  const App({Key? key, required this.authenticationRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouApp',
      home: BlocProvider(
        create: (context) => AuthenticationBloc(authenticationRepository: authenticationRepository)..add(AuthenticationStarted()),
        child: HomeScreen(),
      ),
    );
  }
}
