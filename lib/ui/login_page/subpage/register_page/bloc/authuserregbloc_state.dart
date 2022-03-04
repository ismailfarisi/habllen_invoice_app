part of 'authuserregbloc_bloc.dart';

enum Status { initial, loading, success, error }

@freezed
class AuthuserregblocState with _$AuthuserregblocState {
  const factory AuthuserregblocState({
    @Default(Email.pure()) Email email,
    @Default(Password.pure()) Password password,
    @Default(UserName.pure()) UserName userName,
    @Default(FormzStatus.pure) FormzStatus formzStatus,
    @Default(ConfirmPassword.pure()) ConfirmPassword confirmPassword,
  }) = _AuthuserregblocState;
}
