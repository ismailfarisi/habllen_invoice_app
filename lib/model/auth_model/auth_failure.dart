import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure implements Exception {
  const factory AuthFailure.cancelByUser() = CancelByUser;
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.invalidCredentialError() = InvalidCredentialError;
  const factory AuthFailure.userNotFoundError() = UserNotFoundError;
  const factory AuthFailure.emailAlreadyInUseError() = EmailAlreadyInUseError;
  const factory AuthFailure.invalidEmailError() = InvalidEmailError;
  const factory AuthFailure.weakPasswordError() = WeakPasswordError;
  const factory AuthFailure.wrongPasswordError() = WrongPasswordError;
}
