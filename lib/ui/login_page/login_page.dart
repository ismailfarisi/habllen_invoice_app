import 'package:habllen/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:habllen/shared/widgets/text_field_widget.dart';
import 'package:go_router/go_router.dart';

import 'bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Page page() => MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: BlocProvider(
          create: (BuildContext context) {
            return LoginBloc(context.read<AuthenticationRepository>());
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
    return BlocListener<LoginBloc, LoginState>(
      listener: (BuildContext context, state) {
        if (state.loginWEPStatus.isSubmissionFailure ||
            state.loginWGStatus.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Container(
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    emailFocusNode.onUnFocused(context, EmailUnFocused());
    passwordFocusNode.onUnFocused(context, PasswordUnFocused());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
              return Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 8),
                    CustomTextField(
                      errorText: state.email.invalid ? 'Invalid Email' : null,
                      focusNode: emailFocusNode,
                      helperText: "email",
                      onChanged: (email) =>
                          context.read<LoginBloc>().add(EmailChanged(email)),
                    ),
                    CustomTextField(
                      errorText:
                          state.email.invalid ? 'Invalid Password' : null,
                      focusNode: passwordFocusNode,
                      helperText: "password",
                      obscureText: true,
                      onChanged: (password) => context
                          .read<LoginBloc>()
                          .add(PasswordChanged(password)),
                    ),
                    SizedBox(height: 4),
                    _LoginButton(),
                    SizedBox(height: 8),
                    _RegisterAccountText(),
                    SizedBox(height: 8),
                    Text("OR"),
                    SizedBox(height: 8),
                    googleSignInButton(context),
                    SizedBox(height: 8),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget googleSignInButton(BuildContext context) {
    final status =
        context.select((LoginBloc value) => value.state.loginWGStatus);
    return (status == FormzStatus.submissionInProgress)
        ? const CircularProgressIndicator()
        : ElevatedButton(
            onPressed: () {
              context.read<LoginBloc>().add(LoginWithGooglePressed());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(AssetImage("assets/icon_google.png")),
                  SizedBox(width: 8),
                  Text("Sign in with Google")
                ],
              ),
            ),
          );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.loginWEPStatus.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                child: const Text('LOGIN'),
                onPressed: () =>
                    context.read<LoginBloc>().add(LoginSubmitted()),
              );
      },
    );
  }
}

class _RegisterAccountText extends StatelessWidget {
  const _RegisterAccountText({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?"),
        TextButton(
            onPressed: () {
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => RegisterPage()));
              context.pushNamed("register_page");
            },
            child: const Text("Register")),
      ],
    );
  }
}

extension on FocusNode {
  void onUnFocused(BuildContext context, LoginEvent event) {
    addListener(() {
      if (!this.hasFocus) {
        context.read<LoginBloc>().add(event);
      }
    });
  }
}
