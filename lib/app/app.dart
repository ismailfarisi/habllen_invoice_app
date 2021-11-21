import 'package:authentication_repository/authentication_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/repository/repositoryimpl.dart';
import 'package:habllen/theme.dart';

import 'bloc/auth/authentication_bloc.dart';
import 'route.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.authenticationRepository,
  }) : super(key: key);

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: authenticationRepository,
        ),
        RepositoryProvider<Repository>(
          create: (context) => RepositoryImpl(),
        ),
      ],
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
            authenticationRepository: authenticationRepository),
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerUp: (_) {
          {
            FocusScopeNode focusScopeNode = FocusScope.of(context);
            if (!focusScopeNode.hasPrimaryFocus &&
                focusScopeNode.focusedChild != null) {
              focusScopeNode.focusedChild?.unfocus();
            }
          }
        },
        child: MaterialApp(
          theme: theme,
          routes: routes,
          home: FlowBuilder<AuthenticationStatus>(
            state:
                context.select((AuthenticationBloc bloc) => bloc.state.status),
            onGeneratePages: GenerateRoutes.onGenerateAppViewPages,
          ),
        ));
  }
}
