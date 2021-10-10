import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:googleapis/admob/v1.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/repository/repository.dart';
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
          create: (blocContext) => NewInvoiceBloc(Repository()),
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
    bloc.add(FirstStarted());
    final TextEditingController _companyController = TextEditingController();
    final TextEditingController _controller = TextEditingController();
    return BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, ScreenStage state) {
          return Stepper(
            steps: steps(
              _companyController,
              bloc,
              state.companylist,
            ),
            currentStep: bloc.state.currentIndex,
          );
        });
  }
}

List<Step> steps(TextEditingController _controller, NewInvoiceBloc bloc,
    List<Company> customerList) {
  final DateTime today = DateTime.now();
  return [
    Step(
        title: Text("Add customer"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Autocomplete(
              optionsBuilder: (textEditingVale) {
                return customerList.where((element) => element
                    .toString()
                    .toLowerCase()
                    .contains(textEditingVale.text));
              },
              displayStringForOption: (Company company) => company.companyName,
              onSelected: (str) {
                print('selected is $str');
              },
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 30,
              child: DatePickerDialog(
                initialDate: today,
                firstDate: today.subtract(const Duration(days: 185)),
                lastDate: today.add(const Duration(days: 60)),
              ),
            )
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
}
