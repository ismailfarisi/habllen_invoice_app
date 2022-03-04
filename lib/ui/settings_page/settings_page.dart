import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habllen/app/bloc/auth/authentication_bloc.dart';
import 'package:habllen/app/bloc/theme/theme_bloc.dart';
import 'package:habllen/shared/widgets/my_card.dart';
import 'package:habllen/ui/settings_page/subpages/change_password_page/change_password_page.dart';
import 'package:habllen/ui/settings_page/subpages/company_profile_page/company_profile_page.dart';
import 'package:habllen/ui/settings_page/subpages/manage_subuser_page/manage_subuser_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const String routeName = 'settings_page';

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
            Card(
                margin: EdgeInsets.symmetric(vertical: 1.0),
                child: ListTile(
                    title: Text("DarkMode"), trailing: StatefulSwitch())),
            SizedBox(
              height: 20,
            ),
            MyCard(
              text: "Company Profile",
              ontap: () {
                context.goNamed(CompanyProfilePage.routeName);
              },
            ),
            MyCard(
              text: "Manage SubUsers",
              ontap: () {
                context.goNamed(ManageSubuserPage.routeName);
              },
            ),
            MyCard(
              text: "Change Password",
              ontap: () {
                context.goNamed(ChangePasswordPage.routeName);
              },
            ),
            SizedBox(
              height: 20,
            ),
            MyCard(
                trailing: false,
                ontap: () {
                  context
                      .read<AuthenticationBloc>()
                      .add(AuthenticationLogoutRequested());
                },
                text: "Sign Out")
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
