import 'dart:async';

import 'package:habllen/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:habllen/shared/forms_validator/login_validator.dart';

part 'login_state.dart';
part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._authenticationRepository) : super(const LoginState()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<EmailChanged>(_onEmailChanged);
    on<EmailUnFocused>(_onEmailUnFocused);
    on<PasswordChanged>(_onPasswordChanged);
    on<PasswordUnFocused>(_onPasswordUnFocused);
    on<LoginWithGooglePressed>(_onLoginWithGooglePressed);
  }

  final AuthenticationRepository _authenticationRepository;

  FutureOr<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
        email: Email.dirty(state.email.value),
        password: Password.dirty(state.password.value),
        loginWEPStatus: Formz.validate([state.email, state.password])));
    emit(state.copyWith(loginWEPStatus: FormzStatus.submissionInProgress));
    try {
      final result = await _authenticationRepository.loginWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );

      result.when(success: (_) {
        emit(state.copyWith(loginWEPStatus: FormzStatus.submissionSuccess));
      }, error: (e) {
        print("error on login ${e.toString()}");
        emit(state.copyWith(loginWEPStatus: FormzStatus.submissionFailure));
      });
    } catch (error) {
      print("error on login: $error");
      emit(state.copyWith(loginWEPStatus: FormzStatus.submissionFailure));
    }
  }

  FutureOr<void> _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
        email: email.valid ? email : Email.pure(event.email),
        loginWEPStatus: Formz.validate([email, state.password])));
  }

  FutureOr<void> _onEmailUnFocused(
      EmailUnFocused event, Emitter<LoginState> emit) {
    final email = Email.dirty(state.email.value);
    emit(state.copyWith(
        email: email, loginWEPStatus: Formz.validate([email, state.password])));
  }

  FutureOr<void> _onPasswordChanged(
      PasswordChanged event, Emitter<LoginState> emit) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
        password: password.valid ? password : Password.pure(event.password),
        loginWEPStatus: Formz.validate([state.email, password])));
  }

  FutureOr<void> _onPasswordUnFocused(
      PasswordUnFocused event, Emitter<LoginState> emit) {
    final password = Password.dirty(state.password.value);
    emit(state.copyWith(
        password: password,
        loginWEPStatus: Formz.validate([state.email, password])));
  }

  FutureOr<void> _onLoginWithGooglePressed(
      LoginWithGooglePressed event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginWGStatus: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.logInWithGoogle();
      emit(state.copyWith(loginWGStatus: FormzStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(loginWGStatus: FormzStatus.submissionFailure));
      emit(state.copyWith(loginWGStatus: FormzStatus.pure));
    } on NoSuchMethodError {
      emit(state.copyWith(loginWGStatus: FormzStatus.pure));
    }
  }
}
