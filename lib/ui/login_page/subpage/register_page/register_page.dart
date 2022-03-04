import 'package:habllen/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/shared/widgets/text_field_widget.dart';
import 'package:habllen/ui/login_page/subpage/register_page/bloc/authuserregbloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => AuthuserregblocBloc(
          authenticationRepository: context.read<AuthenticationRepository>(),
          repository: context.read<Repository>()),
      child: Container(
          height: height * .75,
          child: Material(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: PageBody(),
            ),
          )),
    );
  }
}

class PageBody extends StatelessWidget {
  const PageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthuserregblocBloc, AuthuserregblocState>(
      listener: (context, state) {
        if (state.formzStatus == FormzStatus.submissionInProgress) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text('Submitting'),
            ));
        }
      },
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: Text("close")),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        RegisterForm(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {
                context
                    .read<AuthuserregblocBloc>()
                    .add(AuthuserregblocEvent.registerUser());
              },
              child: Text('Register')),
        ),
      ]),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final FocusNode _userNameFocusNode = FocusNode();

  @override
  void initState() {
    _emailFocusNode.onUnFocused(context, AuthuserregblocEvent.emailUnFocused());
    _passwordFocusNode.onUnFocused(
        context, AuthuserregblocEvent.passwordUnFocused());
    _confirmPasswordFocusNode.onUnFocused(
        context, AuthuserregblocEvent.confirmPasswordUnFocused());
    _userNameFocusNode.onUnFocused(
        context, AuthuserregblocEvent.userNameUnFocused());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextField(
            focusNode: _userNameFocusNode,
            onChanged: (p0) => context
                .read<AuthuserregblocBloc>()
                .add(AuthuserregblocEvent.userNameChanged(p0)),
            helperText: 'Name',
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextField(
            focusNode: _emailFocusNode,
            onChanged: (p0) => context
                .read<AuthuserregblocBloc>()
                .add(AuthuserregblocEvent.emailChanged(p0)),
            helperText: 'Email',
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextField(
            focusNode: _passwordFocusNode,
            onChanged: (p0) => context
                .read<AuthuserregblocBloc>()
                .add(AuthuserregblocEvent.passwordChanged(p0)),
            helperText: 'Password',
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextField(
            focusNode: _confirmPasswordFocusNode,
            onChanged: (p0) => context
                .read<AuthuserregblocBloc>()
                .add(AuthuserregblocEvent.confirmPasswordChanged(p0)),
            helperText: 'Confirm Password',
          ),
        ),
      ],
    );
  }
}

extension on FocusNode {
  void onUnFocused(BuildContext context, AuthuserregblocEvent event) {
    this.addListener(() {
      if (!this.hasFocus) {
        context.read<AuthuserregblocBloc>().add(event);
      }
    });
  }
}
