import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import "package:habllen/model/auth_model/auth_models.dart";
import 'package:habllen/model/result.dart';

class FirebaseAuthService {
  FirebaseAuthService({
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

  Future<Result<bool, AuthFailure>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return Result.success(true);
    } on PlatformException catch (e) {
      if (e.code == 'ERROR_USER_NOT_FOUND') {
        return Result.error(AuthFailure.userNotFoundError());
      } else if (e.code == 'ERROR_WRONG_PASSWORD') {
        return Result.error(AuthFailure.wrongPasswordError());
      } else {
        return Result.error(AuthFailure.serverError());
      }
    }
  }

  Future<Result<bool, AuthFailure>> registerWithEmailAndPassword(
      {required String email,
      required String password,
      String? userName}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (userName != null) {
        await _auth.currentUser?.updateDisplayName(userName);
      }

      return Result.success(true);
    } on PlatformException catch (e) {
      print("error in register in auth repository ${e.toString()}");
      if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return Result.error(AuthFailure.emailAlreadyInUseError());
      } else {
        return Result.error(AuthFailure.serverError());
      }
    }
  }

  Future<Result<bool, AuthFailure>> isLoggedIn() async {
    try {
      final firebase_auth.User? user = _auth.currentUser;
      if (user != null) {
        return Result.success(true);
      }
    } on PlatformException {
      return Result.error(const AuthFailure.serverError());
    }
    return Result.success(false);
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
    return User(
        id: uid, email: email!, name: displayName ?? "", photo: photoURL ?? "");
  }
}
