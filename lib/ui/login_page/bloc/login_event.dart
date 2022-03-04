part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginSubmitted extends LoginEvent {}

class LoginWithGooglePressed extends LoginEvent {}

class EmailChanged extends LoginEvent {
  final String email;

  EmailChanged(this.email);
  @override
  List<Object?> get props => [email];
}

class EmailUnFocused extends LoginEvent {}

class PasswordChanged extends LoginEvent {
  final String password;

  PasswordChanged(this.password);
  @override
  List<Object?> get props => [password];
}

class PasswordUnFocused extends LoginEvent {}
