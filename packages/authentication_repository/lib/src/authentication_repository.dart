import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'model/auth_failure.dart';
import 'model/result.dart';

class AuthenticationRepository {
  AuthenticationRepository(
      {FirebaseAuth? firebaseAuth, GoogleSignIn? googleSignIn})
      : _googleSignIn = googleSignIn ?? GoogleSignIn.standard(),
        _auth = firebaseAuth ?? FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _auth;

  Future<Result<User, AuthFailure>> googleSignIn() async {
    try {
      final GoogleSignInAccount googleUser =
          await _googleSignIn.signIn() as GoogleSignInAccount;
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      assert(!user!.isAnonymous);
      // ignore: unnecessary_null_comparison
      assert(await user!.getIdToken() != null);
      final User? currentUser = _auth.currentUser;
      assert(currentUser?.uid == user?.uid);
      return Result.value(currentUser!);
    } on PlatformException catch (e) {
      if (e.code == "ERROR_INVALID_CREDENTIAL") {
        return Result.error(const AuthFailure.invalidCredentialError());
      } else {
        return Result.error(const AuthFailure.serverError());
      }
    }
  }

  Future<Result<bool, AuthFailure>> isLoggedIn() async {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        return Result.value(true);
      }
    } on PlatformException {
      return Result.error(const AuthFailure.serverError());
    }
    return Result.value(false);
  }

  Future<void> logOut() async {
    try {
      await Future.wait([
        _auth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } on Exception {
      print("logout error");
    }
  }
}
