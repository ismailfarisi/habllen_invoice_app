import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/bloc/auth/authentication_bloc.dart';
import 'package:habllen/theme.dart';
import 'package:habllen/widgets/my_card.dart';

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
            Center(
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
                  SizedBox(
                    height: 10,
                  ),
                  Text("Position")
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MyCard(text: "Create SubUser Account"),
            MyCard(text: "Change Password"),
            MyCard(
              text: "aaa",
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
