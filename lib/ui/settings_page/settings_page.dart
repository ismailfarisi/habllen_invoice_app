import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/bloc/auth/authentication_bloc.dart';
import 'package:habllen/theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Settings"),
            centerTitle: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate.fixed([
                Container(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        Container(
                          height: 150,
                          width: 150,
                          decoration: ShapeDecoration(
                              shape: CircleBorder(side: BorderSide.none),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/blank-profile-picture.png"))),
                        ),
                        Text(
                          "Ismail Farisi",
                          style: theme.textTheme.headline2,
                        ),
                        Text("Position")
                      ],
                    ),
                  ),
                ),
            TextButton(
                onPressed: () {
                  context
                      .read<AuthenticationBloc>()
                      .add(AuthenticationLogoutRequested());
                },
                child: Text("Sign Out"))
          ]))
        ],
      ),
    );
  }
}
