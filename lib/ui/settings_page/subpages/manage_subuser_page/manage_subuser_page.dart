import 'package:flutter/material.dart';

class ManageSubuserPage extends StatelessWidget {
  const ManageSubuserPage({Key? key}) : super(key: key);
  static const String routeName = 'ManageSubuserPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Subuser'),
      ),
      body: Center(
        child: Text('Manage Subuser'),
      ),
    );
  }
}
