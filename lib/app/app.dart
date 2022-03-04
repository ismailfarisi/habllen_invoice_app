import 'package:habllen/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/app/bloc/theme/theme_bloc.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/theme.dart';
import 'package:habllen/ui/home/bloc/hometab_bloc.dart';
import 'package:habllen/ui/invoice_page/invoice_bloc/invoicepage_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

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
    final authBloc =
        AuthenticationBloc(authenticationRepository: authenticationRepository);
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
          BlocProvider.value(
            value: authBloc,
          ),
          BlocProvider(
            create: (context) => HometabBloc(),
          ),
        ],
        child: RepositoryProvider(
          create: (context) => Routes(authBloc, repository),
          child: AppView(),
        ),
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
    final route = context.read<Routes>().mainRoutes();
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
          builder: (context, state) => GlobalLoaderOverlay(
            child: MaterialApp.router(
              routeInformationParser: route.routeInformationParser,
              routerDelegate: route.routerDelegate,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: state.themeMode,
              debugShowCheckedModeBanner: false,
            ),
          ),
        ));
  }
}
