import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  static Page page() => MaterialPage<void>(child: SplashPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('SPLASH PAGE')),
    );
  }
}
