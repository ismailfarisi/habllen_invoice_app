part of 'authuserregbloc_bloc.dart';

@freezed
class AuthuserregblocEvent with _$AuthuserregblocEvent {
  const factory AuthuserregblocEvent.registerUser() = _RegisterUser;
  const factory AuthuserregblocEvent.userNameChanged(String userName) =
      _UserNameChanged;
  const factory AuthuserregblocEvent.emailChanged(String email) = _EmailChanged;
  const factory AuthuserregblocEvent.passwordChanged(String password) =
      _PasswordChanged;
  const factory AuthuserregblocEvent.userNameUnFocused() = _UserNameUnFocused;
  const factory AuthuserregblocEvent.emailUnFocused() = _EmailUnFocused;
  const factory AuthuserregblocEvent.passwordUnFocused() = _PasswordUnFocused;
  const factory AuthuserregblocEvent.confirmPasswordChanged(
      String confirmPassword) = _ConfirmPasswordChanged;
  const factory AuthuserregblocEvent.confirmPasswordUnFocused() =
      _ConfirmPasswordUnFocused;
}
