import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure implements Exception {
  const factory AuthFailure.cancelByUser() = CancelByUser;
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.invalidCredentialError() = InvalidCredentialError;
}
