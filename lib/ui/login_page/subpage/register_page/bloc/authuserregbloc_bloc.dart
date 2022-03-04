import 'dart:async';

import 'package:habllen/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/shared/forms_validator/login_validator.dart';

part 'authuserregbloc_event.dart';
part 'authuserregbloc_state.dart';
part 'authuserregbloc_bloc.freezed.dart';

class AuthuserregblocBloc
    extends Bloc<AuthuserregblocEvent, AuthuserregblocState> {
  AuthuserregblocBloc(
      {required AuthenticationRepository authenticationRepository,
      required Repository repository})
      : _authenticationRepository = authenticationRepository,
        _repository = repository,
        super(AuthuserregblocState()) {
    on<_RegisterUser>(_registerUser);
    on<_PasswordChanged>(_passwordChanged);
    on<_EmailChanged>(_emailChanged);
    on<_UserNameChanged>(_userNameChanged);
    on<_ConfirmPasswordChanged>(_confirmPasswordChanged);
    on<_EmailUnFocused>(_emailUnFocused);
    on<_UserNameUnFocused>(_userNameUnFocused);
    on<_PasswordUnFocused>(_passwordUnFocused);
    on<_ConfirmPasswordUnFocused>(_confirmPasswordUnFocused);
  }
  final AuthenticationRepository _authenticationRepository;
  final Repository _repository;

  FutureOr<void> _registerUser(
      _RegisterUser event, Emitter<AuthuserregblocState> emit) async {
    emit(state.copyWith(
      email: Email.dirty(state.email.value),
      userName: UserName.dirty(state.userName.value),
      password: Password.dirty(state.password.value),
      confirmPassword: ConfirmPassword.dirty(
          value: state.confirmPassword.value, password: state.password.value),
      formzStatus: Formz.validate(
          [state.email, state.userName, state.password, state.confirmPassword]),
    ));
    if (state.formzStatus.isValid) {
      try {
        final result =
            await _authenticationRepository.registerWithEmailAndPassword(
                email: state.email.value, password: state.password.value);
        result.when(success: (_) {
          emit(state.copyWith(formzStatus: FormzStatus.submissionSuccess));
        }, error: (e) {
          emit(state.copyWith(formzStatus: FormzStatus.submissionFailure));
        });
      } catch (e) {
        print("error in register user ${e.toString()}");
        emit(state.copyWith(formzStatus: FormzStatus.submissionFailure));
      }
    }
  }

  FutureOr<void> _passwordChanged(
      _PasswordChanged event, Emitter<AuthuserregblocState> emit) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
        password: password.valid ? password : Password.pure(event.password),
        formzStatus: Formz.validate(
            [state.email, state.userName, password, state.confirmPassword])));
  }

  FutureOr<void> _emailChanged(
      _EmailChanged event, Emitter<AuthuserregblocState> emit) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
        email: email.valid ? email : Email.pure(event.email),
        formzStatus: Formz.validate(
            [email, state.userName, state.password, state.confirmPassword])));
  }

  FutureOr<void> _userNameChanged(
      _UserNameChanged event, Emitter<AuthuserregblocState> emit) {
    final userName = UserName.dirty(event.userName);
    emit(state.copyWith(
        userName: userName.valid ? userName : UserName.pure(event.userName),
        formzStatus: Formz.validate(
            [state.email, userName, state.password, state.confirmPassword])));
  }

  FutureOr<void> _confirmPasswordChanged(
      _ConfirmPasswordChanged event, Emitter<AuthuserregblocState> emit) {
    final confirmPassword = ConfirmPassword.dirty(
        value: event.confirmPassword, password: state.password.value);
    emit(state.copyWith(
        confirmPassword: confirmPassword.valid
            ? confirmPassword
            : ConfirmPassword.pure(event.confirmPassword),
        formzStatus: Formz.validate(
            [state.email, state.userName, state.password, confirmPassword])));
  }

  FutureOr<void> _emailUnFocused(
      _EmailUnFocused event, Emitter<AuthuserregblocState> emit) {
    emit(state.copyWith(
        email: Email.dirty(state.email.value),
        formzStatus: Formz.validate([
          state.email,
          state.userName,
          state.password,
          state.confirmPassword
        ])));
  }

  FutureOr<void> _userNameUnFocused(
      _UserNameUnFocused event, Emitter<AuthuserregblocState> emit) {
    emit(state.copyWith(
        userName: UserName.dirty(state.userName.value),
        formzStatus: Formz.validate([
          state.email,
          state.userName,
          state.password,
          state.confirmPassword
        ])));
  }

  FutureOr<void> _passwordUnFocused(
      _PasswordUnFocused event, Emitter<AuthuserregblocState> emit) {
    emit(state.copyWith(
        password: Password.dirty(state.password.value),
        formzStatus: Formz.validate([
          state.email,
          state.userName,
          state.password,
          state.confirmPassword
        ])));
  }

  FutureOr<void> _confirmPasswordUnFocused(
      _ConfirmPasswordUnFocused event, Emitter<AuthuserregblocState> emit) {
    emit(state.copyWith(
        confirmPassword: ConfirmPassword.dirty(
            value: state.confirmPassword.value, password: state.password.value),
        formzStatus: Formz.validate([
          state.email,
          state.userName,
          state.password,
          state.confirmPassword
        ])));
  }
}
