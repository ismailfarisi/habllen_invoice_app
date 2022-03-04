import 'package:habllen/model/result.dart';
import 'package:habllen/model/auth_model/auth_models.dart';
import 'package:habllen/repository/auth_repository.dart';
import 'package:habllen/repository/remote/firebase_auth.dart';

class AuthRepositoryImpl implements AuthenticationRepository {
  final FirebaseAuthService _firebaseAuthService;

  AuthRepositoryImpl(FirebaseAuthService firebaseAuthService)
      : _firebaseAuthService = firebaseAuthService;

  @override
  Future<Result<bool, AuthFailure>> isLoggedIn() =>
      _firebaseAuthService.isLoggedIn();

  @override
  Future<void> logInWithGoogle() => _firebaseAuthService.logInWithGoogle();

  @override
  Future<Result<bool, AuthFailure>> loginWithEmailAndPassword(
          {required String email, required String password}) =>
      _firebaseAuthService.loginWithEmailAndPassword(
          email: email, password: password);

  @override
  Future<Result<bool, AuthFailure>> registerWithEmailAndPassword(
          {required String email,
          required String password,
          String? userName}) =>
      _firebaseAuthService.registerWithEmailAndPassword(
          email: email, password: password, userName: userName);

  @override
  Future<void> logOut() => _firebaseAuthService.logOut();

  @override
  Stream<User> get user => _firebaseAuthService.user;
}
