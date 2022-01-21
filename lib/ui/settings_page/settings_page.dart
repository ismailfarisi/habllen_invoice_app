import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habllen/app/bloc/auth/authentication_bloc.dart';
import 'package:habllen/app/bloc/theme/theme_bloc.dart';
import 'package:habllen/shared/widgets/my_card.dart';

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
            SizedBox(
              height: 10,
            ),
            // Center(
            //   child: Column(
            //     children: [
            //       SizedBox(
            //         height: 70,
            //       ),
            //       Container(
            //         height: 150,
            //         width: 150,
            //         decoration: ShapeDecoration(
            //             shape: CircleBorder(side: BorderSide.none),
            //             image: DecorationImage(
            //                 image: AssetImage(
            //                     "assets/blank-profile-picture.png"))),
            //       ),
            //       Text(
            //         "Ismail Farisi",
            //         style: theme.textTheme.headline2,
            //       ),
            //       SizedBox(
            //         height: 10,
            //       ),
            //       Text("Position")
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            Card(
                margin: EdgeInsets.symmetric(vertical: 1.0),
                child: ListTile(
                    title: Text("DarkMode"), trailing: StatefulSwitch())),

            MyCard(text: "Profile"),
            MyCard(text: "Create SubUser Account"),
            MyCard(text: "Change Password"),
            SizedBox(
              height: 20,
            ),
            Card(
              child: ListTile(
                leading: Text("Products"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  context.goNamed("product_list_page");
                },
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

class StatefulSwitch extends StatefulWidget {
  const StatefulSwitch({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulSwitch> createState() => _StatefulSwitchState();
}

class _StatefulSwitchState extends State<StatefulSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      onChanged: (value) => context.read<ThemeBloc>().add(ThemeEvent.changed()),
      value: context.select((ThemeBloc value) => value.state.themeMode) ==
          ThemeMode.dark,
    );
  }
}
