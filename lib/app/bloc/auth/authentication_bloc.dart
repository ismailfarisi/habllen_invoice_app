import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>
    with ChangeNotifier {
  AuthenticationBloc(
      {required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.unknown()) {
    on<AppStarted>(_onAppStarted);

    on<AuthenticationUserChanged>(_onAuthenticationUserChanged);

    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);

    _userSubscription = _authenticationRepository.user
        .listen((user) => add(AuthenticationUserChanged(user)));
  }

  final AuthenticationRepository _authenticationRepository;

  late StreamSubscription<User> _userSubscription;

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }

  FutureOr<void> _onAppStarted(
      AppStarted event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationState.unknown());
  }

  FutureOr<void> _onAuthenticationUserChanged(
      AuthenticationUserChanged event, Emitter<AuthenticationState> emit) {
    final status = event.user != User.empty
        ? AuthenticationState.authenticated(event.user)
        : const AuthenticationState.unauthenticated();
    emit(status);
    notifyListeners();
  }

  FutureOr<void> _onAuthenticationLogoutRequested(
      AuthenticationLogoutRequested event, Emitter<AuthenticationState> emit) {
    unawaited(_authenticationRepository.logOut());
  }
}
