import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habllen/theme.dart';
import 'package:habllen/ui/customer_page/customer_page.dart';
import 'package:habllen/ui/expense_page/expense_page.dart';
import 'package:habllen/ui/invoice_page/sales_page.dart';
import 'package:habllen/ui/settings_page/settings_page.dart';

class HomePage extends StatefulWidget {
  static Page page() => MaterialPage<void>(child: HomePage());

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwitchBody(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: "Invoice",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: "Expense",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: "Finance",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: theme.primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class SwitchBody extends StatelessWidget {
  const SwitchBody(this.selectedIndex, {Key? key}) : super(key: key);
  final selectedIndex;
  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return InvoiceBody();
      case 1:
        return ExpensePage();
      case 2:
        return CustomerPage();
      case 3:
        return SettingsPage();
      default:
        return InvoiceBody();
    }
  }
}
