import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      {required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.unknown()) {
    _userSubscription = _authenticationRepository.user
        .listen((user) => add(AuthenticationUserChanged(user)));
  }

  final AuthenticationRepository _authenticationRepository;

  late StreamSubscription<User> _userSubscription;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield AuthenticationState.unknown();
    }
    if (event is AuthenticationUserChanged) {
      yield _mapAuthenticationUserChangedToState(event);
    } else if (event is AuthenticationLogoutRequested) {
      unawaited(_authenticationRepository.logOut());
    }
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }

  AuthenticationState _mapAuthenticationUserChangedToState(
    AuthenticationUserChanged event,
  ) {
    return event.user != User.empty
        ? AuthenticationState.authenticated(event.user)
        : const AuthenticationState.unauthenticated();
  }
}
