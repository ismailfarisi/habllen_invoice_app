import 'package:flutter/material.dart';

import 'bloc/manage_subuser_bloc.dart';
import "package:flutter_bloc/flutter_bloc.dart";

class ManageSubuserPage extends StatelessWidget {
  const ManageSubuserPage({Key? key}) : super(key: key);
  static const String routeName = 'ManageSubuserPage';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManageSubusersBloc(repository: context.read()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Manage Subuser'),
        ),
        body: Center(
          child: Text('Manage Subuser'),
        ),
      ),
    );
  }
}
