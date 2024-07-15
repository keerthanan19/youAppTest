import 'package:bloc/bloc.dart';
import 'package:you_app_test/blocs/auth_bloc/auth_state.dart';
import 'package:you_app_test/models/user.dart';
import 'package:you_app_test/blocs/auth_bloc/auth_event.dart';
import 'package:you_app_test/repositories/auth_repository.dart';


class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;

  AuthenticationBloc({required this.authenticationRepository}) : super(AuthenticationInitial()) {
    on<AuthenticationStarted>(_onAuthenticationStarted);
    on<AuthenticationLoggedIn>(_onAuthenticationLoggedIn);
    on<AuthenticationLoggedOut>(_onAuthenticationLoggedOut);
  }

  void _onAuthenticationStarted(AuthenticationStarted event, Emitter<AuthenticationState> emit) async {
    final bool hasToken = await authenticationRepository.hasToken();

    if (hasToken) {
      final User user = await authenticationRepository.getUser();
      emit(AuthenticationSuccess(user: user));
    } else {
      emit(AuthenticationFailure());
    }
  }

  void _onAuthenticationLoggedIn(AuthenticationLoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationSuccess(user: event.user));
  }

  void _onAuthenticationLoggedOut(AuthenticationLoggedOut event, Emitter<AuthenticationState> emit) async {
    await authenticationRepository.logout();
    emit(AuthenticationFailure());
  }
}
