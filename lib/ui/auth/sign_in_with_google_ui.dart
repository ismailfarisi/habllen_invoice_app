import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/bloc/auth/google_login_bloc.dart';

class SignInWithGoogleUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Habllen"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 100.0,
            ),
            Text("Sign In with Google"),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 50.0,
              child: BlocListener<GoogleLoginBloc, GoogleLoginState>(
                  listener: (context, state) {
                Center(
                  child: Text("data"),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
