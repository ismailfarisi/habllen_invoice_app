import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'model/auth_failure.dart';
import 'model/models.dart';
import 'model/result.dart';

class AuthenticationRepository {
  AuthenticationRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _googleSignIn = googleSignIn ??
            GoogleSignIn.standard(scopes: [
              'email',
            ]),
        _auth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn;
  final firebase_auth.FirebaseAuth _auth;

  Future<void> logInWithGoogle() async {
    try {
      firebase_auth.AuthCredential credential;

      final googleUser = await _googleSignIn.signIn();
      print("654564");
      final googleAuth = await googleUser?.authentication;
      var idtoken = googleAuth?.idToken;

      credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      print(idtoken);

      await _auth.signInWithCredential(credential);
      print("sign in success");
    } on Exception catch (e) {
      print("sign in error");
      print(e);
      throw AuthFailure.serverError();
    }
  }

  Future<Result<bool, AuthFailure>> isLoggedIn() async {
    try {
      final firebase_auth.User? user = _auth.currentUser;
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

  Stream<User> get user {
    return _auth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null ? User.empty : firebaseUser.toUser;
    });
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(id: uid, email: email!, name: displayName!, photo: photoURL!);
  }
}
