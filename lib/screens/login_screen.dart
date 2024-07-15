import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:you_app_test/blocs/auth_bloc/auth_bloc.dart';
import 'package:you_app_test/blocs/auth_bloc/auth_event.dart';
import 'package:you_app_test/repositories/auth_repository.dart';


class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final email = _emailController.text;
                final password = _passwordController.text;

                final authenticationRepository = RepositoryProvider.of<AuthenticationRepository>(context);

                authenticationRepository.authenticate(email: email, password: password).then((user) {
                  BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationLoggedIn(user: user));
                }).catchError((error) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to login')));
                });
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
