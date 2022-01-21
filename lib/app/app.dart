import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/app/bloc/theme/theme_bloc.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/theme.dart';
import 'package:habllen/ui/home/bloc/hometab_bloc.dart';
import 'package:habllen/ui/invoice_page/invoice_bloc/invoicepage_bloc.dart';

import 'bloc/auth/authentication_bloc.dart';
import 'route.dart';

class App extends StatelessWidget {
  const App(
      {Key? key,
      required this.authenticationRepository,
      required this.repository})
      : super(key: key);

  final AuthenticationRepository authenticationRepository;
  final Repository repository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: authenticationRepository,
        ),
        RepositoryProvider.value(value: repository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ThemeBloc()),
          BlocProvider(
            create: (_) => AuthenticationBloc(
                authenticationRepository: authenticationRepository),
          ),
          BlocProvider(
            create: (context) => HometabBloc(),
          ),
          BlocProvider(create: (_) => InvoiceBloc(repository: repository)),
        ],
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
  void initState() {
    context.read<ThemeBloc>().add(ThemeEvent.started());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final route = routes(context.watch<AuthenticationBloc>());
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
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) => MaterialApp.router(
            routeInformationParser: route.routeInformationParser,
            routerDelegate: route.routerDelegate,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state.themeMode,
          ),
        ));
  }
}
