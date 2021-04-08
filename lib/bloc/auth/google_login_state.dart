part of 'google_login_bloc.dart';

@freezed
abstract class GoogleLoginState with _$GoogleLoginState {
  const factory GoogleLoginState.initial() = _Initial;
  const factory GoogleLoginState.authenticated() = _Authenticated;
  const factory GoogleLoginState.unauthenticated() = _Unauthenticated;
  const factory GoogleLoginState.isSubmitting() = _IsSubmitting;
}
