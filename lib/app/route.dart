import 'package:flutter/material.dart';
import 'package:habllen/bloc/auth/authentication_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:habllen/ui/home/home.dart';
import 'package:habllen/ui/login_page/login_page.dart';
import 'package:habllen/ui/splash_page/splash_page.dart';

class GenerateRoutes {
  static List<Page> onGenerateAppViewPages(
      AuthenticationStatus state, List<Page<dynamic>> pages) {
    switch (state) {
      case AuthenticationStatus.authenticated:
        return [HomePage.page()];
      case AuthenticationStatus.unknown:
        return [SplashPage.page()];
      case AuthenticationStatus.unauthenticated:
      default:
        return [LoginPage.page()];
    }
  }
}
