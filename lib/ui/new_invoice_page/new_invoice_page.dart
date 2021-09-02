import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/ui/new_invoice_page/cubit/new_invoice_Bloc.dart';

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
          child: StepperWidget(),
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
    final TextEditingController _companyController = TextEditingController();
    final TextEditingController _controller = TextEditingController();
    return BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, ScreenStage state) {
          return Stepper(
            steps: steps(_companyController),
            currentStep: bloc.state.currentIndex,
            onStepContinue: () => bloc.add(CustomerAdded(Company())),
          );
        });
  }
}

List<Step> steps(TextEditingController _controller) => [
      Step(
          title: Text("Add customer"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(),
              SizedBox(
                height: 15,
              ),
              TextFormField(),
              SizedBox(
                height: 15,
              ),
              Text("invoice")
            ],
          )),
      Step(
          title: Text("Add Product"),
          content: Column(
            children: [
              TextFormField(),
              SizedBox(
                height: 15,
              ),
              TextFormField(),
              SizedBox(
                height: 15,
              ),
              Text("invoice")
            ],
          ))
    ];
