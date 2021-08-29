import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/new_invoice_Bloc.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);
  static Page page() => MaterialPage<void>(child: Screen2());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("screen2"),
        TextButton(
            onPressed: () {
              context.read<NewInvoiceBloc>()..add(ScreenTwoFinished());
            },
            child: Text("Next"))
      ],
    );
  }
}
