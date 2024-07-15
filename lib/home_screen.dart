import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:you_app_test/blocs/auth_bloc/auth_bloc.dart';
import 'package:you_app_test/blocs/auth_bloc/auth_event.dart';
import 'package:you_app_test/blocs/auth_bloc/auth_state.dart';
import 'package:you_app_test/screens/login_screen.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationSuccess) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Welcome ${state.user.name}'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () {
                    BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationLoggedOut());
                  },
                )
              ],
            ),
            body: Center(child: Text('User ID: ${state.user.id}')),
          );
        }
        if (state is AuthenticationFailure) {
          return LoginScreen();
        }
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
