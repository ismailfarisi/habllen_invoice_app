import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:habllen/bloc/login/login_cubit.dart';
import 'package:formz/formz.dart';

class LoginPage extends StatelessWidget {
  static Page page() => MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Habllen"),
      ),
      body: BlocProvider(
          create: (BuildContext context) {
            return LoginCubit(context.read<AuthenticationRepository>());
          },
          child: _Login()),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (BuildContext context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Container(
        child: Stack(
          children: [
            Positioned.fill(

                child: Align(
                  alignment: Alignment.center,
                  child: _LoginButton(),
                )
            )
          ],
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  primary: const Color(0xFFFFD600),
                ),
                child: const Text('LOGIN'),
                onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
              );
      },
    );
  }
}
