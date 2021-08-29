import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/ui/new_invoice_page/cubit/new_invoice_Bloc.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);
  static Page page() => MaterialPage<void>(child: Screen1());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("screen1"),
        TextButton(
            onPressed: () {
              context.read<NewInvoiceBloc>()..add(ScreenOneFinished());
            },
            child: Text("Next"))
      ],
    );
  }
}
