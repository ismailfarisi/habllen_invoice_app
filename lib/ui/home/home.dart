import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:habllen/bloc/auth/authentication_bloc.dart';
import 'package:habllen/theme.dart';
import 'package:habllen/ui/expense_page/expense_page.dart';
import 'package:habllen/ui/invoice_page/create_invoice_page.dart';

class HomePage extends StatelessWidget {
  static Page page() => MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(children: [
        ListTile(
            title: Text("Sign Out"),
            onTap: () {
              context
                  .read<AuthenticationBloc>()
                  .add(AuthenticationLogoutRequested());
            })
      ])),
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            _ListTile("Sales", CreateInvoicePage()),
            _ListTile("Expenses", ExpensePage()),
          ],
        ),
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  _ListTile(this.text, this.route);
  final text;
  final route;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size.fromHeight(60))),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => route));
        },
        child: Text(text),
      ),
    );
  }
}
