import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:habllen/repository/remote/firestore.dart';
import 'package:habllen/repository/repositoryimpl.dart';
import 'app/app.dart';
import 'bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(App(
      authenticationRepository: AuthenticationRepository(),
      repository: RepositoryImpl(firebaseRepository: FirebaseRepository())));
}
