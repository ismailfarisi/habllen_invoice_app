import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/ui/new_invoice_page/cubit/new_invoice_cubit.dart';
import 'package:habllen/ui/new_invoice_page/onGenerate.dart';

class NewInvoicePage extends StatelessWidget {
  const NewInvoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CREATE NEW INVOICE"),
        ),
        body: BlocProvider(
          create: (context) => NewInvoiceCubit(),
          child: FlowForm(),
        ));
  }
}

class FlowForm extends StatelessWidget {
  const FlowForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<ScreenStage>(
      onGeneratePages: onGenerateRoute,
      state: context.select((NewInvoiceCubit cubit) => cubit.state.screenStage),
    );
  }
}
