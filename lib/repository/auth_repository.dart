import 'package:habllen/model/auth_model/auth_failure.dart';
import 'package:habllen/model/auth_model/auth_models.dart';
import 'package:habllen/model/result.dart';

abstract class AuthenticationRepository {
  Future<void> logInWithGoogle();
  Future<Result<bool, AuthFailure>> loginWithEmailAndPassword(
      {required String email, required String password});
  Future<Result<bool, AuthFailure>> registerWithEmailAndPassword(
      {required String email, required String password, String? userName});
  Future<Result<bool, AuthFailure>> isLoggedIn();
  Future<void> logOut();
  Stream<User> get user;
}
