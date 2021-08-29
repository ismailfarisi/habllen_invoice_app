import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/new_invoice_Bloc.dart';

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);
  static Page page() => MaterialPage<void>(child: Screen3());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("screen3"),
        TextButton(
            onPressed: () {
              context.read<NewInvoiceBloc>()..add(ScreenThreeFinished());
            },
            child: Text("Next"))
      ],
    );
  }
}
