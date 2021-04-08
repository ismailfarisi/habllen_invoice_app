import 'package:authentication_repository/authentication_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'google_login_event.dart';
part 'google_login_state.dart';
part 'google_login_bloc.freezed.dart';

class GoogleLoginBloc extends Bloc<GoogleLoginEvent, GoogleLoginState> {
  GoogleLoginBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(GoogleLoginState.initial());

  final AuthenticationRepository _authenticationRepository;

  @override
  Stream<GoogleLoginState> mapEventToState(
    GoogleLoginEvent event,
  ) async* {
    if (event is SignInWithGooglePressed) {
      yield GoogleLoginState.isSubmitting();
      late bool login;
      await _authenticationRepository
          .googleSignIn()
          .then((result) => result.when(
                value: (value) => login = true,
                error: (error) => login = false,
                none: () {
                  login = false;
                },
              ));
      if (login) {
        yield GoogleLoginState.authenticated();
      } else if (!login) {
        yield GoogleLoginState.unauthenticated();
      }
    }
  }
}
