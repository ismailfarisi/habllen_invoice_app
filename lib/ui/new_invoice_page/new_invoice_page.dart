import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/model/company.dart';
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
          create: (blocContext) => NewInvoiceBloc(),
          child: Column(
            children: [
              StepperWidget(),

              //FlowForm(),
            ],
          ),
        ));
  }
}

class StepperWidget extends StatelessWidget {
  const StepperWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NewInvoiceBloc>();
    return BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, ScreenStage state) {
          return Stepper(
            steps: [
              Step(
                  title: Text("Add customer"),
                  content: Column(
                    children: [
                      TextFormField(),
                      TextFormField(),
                      Text("invoice")
                    ],
                  )),
              Step(
                  title: Text("Add Product"),
                  content: Column(
                    children: [
                      TextFormField(),
                      TextFormField(),
                      Text("invoice")
                    ],
                  ))
            ],
            currentStep: bloc.state.currentIndex,
            onStepContinue: () => bloc.add(CustomerAdded(Company())),
          );
        });
  }
}

class FlowForm extends StatelessWidget {
  const FlowForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<int>(
      onGeneratePages: onGenerateRoute,
      state: context.select((NewInvoiceBloc bloc) => bloc.state.currentIndex),
    );
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
