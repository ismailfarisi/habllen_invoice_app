part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState(
      {this.loginWEPStatus = FormzStatus.pure,
      this.loginWGStatus = FormzStatus.pure,
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      th});

  final FormzStatus loginWEPStatus;
  final FormzStatus loginWGStatus;
  final Email email;
  final Password password;

  @override
  List<Object> get props => [loginWEPStatus, loginWGStatus, email, password];

  LoginState copyWith(
      {FormzStatus? loginWEPStatus,
      FormzStatus? loginWGStatus,
      Email? email,
      Password? password}) {
    return LoginState(
        loginWEPStatus: loginWEPStatus ?? this.loginWEPStatus,
        loginWGStatus: loginWGStatus ?? this.loginWGStatus,
        email: email ?? this.email,
        password: password ?? this.password);
  }
}
