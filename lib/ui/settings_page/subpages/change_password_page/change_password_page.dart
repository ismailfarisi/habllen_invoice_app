import 'package:flutter/material.dart';
import 'package:habllen/shared/widgets/text_field_widget.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  static const String routeName = 'change_password_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        centerTitle: true,
      ),
      body: Column(children: [
        CustomTextField(helperText: 'Enter your current password'),
        CustomTextField(helperText: 'Enter your new password'),
        CustomTextField(helperText: 'Confirm your new password'),
        ElevatedButton(onPressed: () {}, child: Text("change password"))
      ]),
    );
  }
}
