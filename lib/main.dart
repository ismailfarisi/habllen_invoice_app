import 'package:habllen/repository/auth_repositoryimpl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:habllen/repository/remote/firebase_auth.dart';
import 'package:habllen/repository/remote/firestore.dart';
import 'package:habllen/repository/repositoryimpl.dart';
import 'app/app.dart';
import 'bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final authRepository = AuthRepositoryImpl(FirebaseAuthService());

  bootstrap(() => App(
      authenticationRepository: authRepository,
      repository: RepositoryImpl(
          firebaseRepository: FirebaseRepository(authRepository.user))));
}
