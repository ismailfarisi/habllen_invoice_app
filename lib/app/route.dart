import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:habllen/ui/home/home.dart';
import 'package:habllen/ui/invoice_page/subpages/new_invoice_page/new_invoice_page.dart';
import 'package:habllen/ui/login_page/login_page.dart';
import 'package:habllen/ui/splash_page/splash_page.dart';

import 'bloc/auth/authentication_bloc.dart';

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

final routes = {
  '/': (context) => const HomePage(),
  '/login': (context) => const LoginPage(),
  '/create_new_invoice': (context) => const NewInvoicePage(),
  '/invoice_details': (context) => const NewInvoicePage(),
};
