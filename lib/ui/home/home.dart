import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/ui/customer_page/customer_page.dart';
import 'package:habllen/ui/home/bloc/hometab_bloc.dart';
import 'package:habllen/ui/invoice_page/sales_page.dart';
import 'package:habllen/ui/settings_page/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => MaterialPage<void>(child: HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<HometabBloc>();
    return Scaffold(
      body: SwitchBody(bloc.state.currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: "Invoice",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: "Companies",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        currentIndex: bloc.state.currentIndex,
        onTap: (index) => bloc.add(TabChanged(index)),
      ),
      // ),
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
        return CustomerPage();
      case 2:
        return SettingsPage();
      default:
        return InvoiceBody();
    }
  }
}
