part of 'google_login_bloc.dart';


@freezed
abstract class GoogleLoginEvent with _$GoogleLoginEvent {
  const factory GoogleLoginEvent.signInWithGooglePressed() = SignInWithGooglePressed;
  const factory GoogleLoginEvent.appOpened()= AppOpened;
}