import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/ui/new_invoice_page/cubit/new_invoice_Bloc.dart';
import 'package:habllen/ui/new_invoice_page/onGenerate.dart';

class NewInvoicePage extends StatelessWidget {
  const NewInvoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text("CREATE NEW INVOICE"),
        ),
        body: BlocProvider(
          create: (context) => NewInvoiceBloc(),
          child: Column(
            children: [
              Stepper(
                  steps: steps,
                  currentStep: context.select(
                      (NewInvoiceBloc value) => value.state.currentIndex),
                  controlsBuilder: (BuildContext context,
                      {VoidCallback? onStepContinue,
                      VoidCallback? onStepCancel}) {
                    return Row(
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            context.read<NewInvoiceBloc>()
                              ..add(CustomerAdded());
                          },
                          child: const Text('NEXT'),
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<NewInvoiceBloc>()..add(ProductAdded());
                          },
                          child: const Text('CANCEL'),
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ));
  }
}

List<Step> steps = [
  Step(
      title: Text("Add customer"),
      content: Column(
        children: [TextFormField(), TextFormField(), Text("invoice")],
      )),
  Step(
      title: Text("Add Product"),
      content: Column(
        children: [TextFormField(), TextFormField(), Text("invoice")],
      ))
];
