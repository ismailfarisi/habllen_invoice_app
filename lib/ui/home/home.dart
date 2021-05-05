import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:habllen/ui/customer_page/customer_page.dart';
import 'package:habllen/ui/expense_page/expense_page.dart';
import 'package:habllen/ui/invoice_page/create_invoice_page.dart';

class HomePage extends StatelessWidget {
  static Page page() => MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        backgroundColor: Colors.lightGreen[800],
      ),
      body: Container(
        color: Colors.grey[300],
        padding: EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            _GridTile("create invoice", CreateInvoicePage()),
            _GridTile("Add expence", ExpensePage()),
            _GridTile("add new customer", CustomerPage())
          ],
        ),
      ),
    );
  }
}

class _GridTile extends StatelessWidget {
  _GridTile(this.text, this.route);
  final text;
  final route;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => route));
      },
      child: Card(
        elevation: 0.0,
        color: Colors.lightGreen,
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
