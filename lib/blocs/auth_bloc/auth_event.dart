
import 'package:equatable/equatable.dart';
import 'package:you_app_test/models/user.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStarted extends AuthenticationEvent {}

class AuthenticationLoggedIn extends AuthenticationEvent {
  final User user;

  const AuthenticationLoggedIn({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthenticationLoggedOut extends AuthenticationEvent {}
