import 'package:flutter/material.dart';
import 'package:habllen/bloc/auth/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextButton(
          onPressed: () {
            context
                .read<AuthenticationBloc>()
                .add(AuthenticationLogoutRequested());
          },
          child: Text("sign Out"),
        ),
      ),
    );
  }
}
