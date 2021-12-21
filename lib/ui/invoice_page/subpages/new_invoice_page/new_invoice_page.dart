import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/model/invoice_product.dart';
import 'package:habllen/repository/repository.dart';

import 'package:habllen/ui/invoice_page/subpages/draft_invoice_page/draft_invoice_page.dart';
import 'package:habllen/shared/widgets/custom_autocomplete.dart';
import 'package:habllen/shared/widgets/date_util.dart' show DateString;
import 'package:habllen/ui/invoice_page/subpages/add_invoice_product_dialog/add_invoice_product_dialog.dart';

import 'cubit/new_invoice_Bloc.dart';

const int BASIC_INFO_STEP = 0;
const int PRODUCT_ENTRY_STEP = 1;

class NewInvoicePage extends StatelessWidget {
  const NewInvoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black54),
        ),
        title: Text(
          "CREATE INVOICE",
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: StepperWidget(),
    );
  }
}

class StepperWidget extends StatelessWidget {
  final _formKeyBasicDetails = GlobalKey<FormState>();

  StepperWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NewInvoiceBloc>();
    bloc.add(FirstStarted());
    final DateTime today = DateTime.now();

    return BlocConsumer<NewInvoiceBloc, ScreenStage>(
        listenWhen: (previousState, currentState) {
          return (previousState.invoice != currentState.invoice);
        },
        listener: (context, state) {
          if (state.invoice != null) {
            context.goNamed("draft_invoice_page",
                extra: state.invoice,
                params: {"invoice_no": state.invoice!.invoiceNo.toString()});
          }
        },
        bloc: bloc,
        builder: (BuildContext context, ScreenStage state) {
          if (state.invoice != null) {}
          return Stepper(
            controlsBuilder: (BuildContext context,
                {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                        onPressed: onStepCancel, child: Text("cancel")),
                    SizedBox(
                      width: 8,
                    ),
                    (bloc.state.currentIndex != PRODUCT_ENTRY_STEP)
                        ? ElevatedButton(
                            onPressed: onStepContinue, child: Text("Continue"))
                        : ElevatedButton(
                            onPressed: onStepContinue, child: Text('Create'))
                  ],
                ),
              );
            },
            onStepTapped: (index) {
              bloc.add(OnStepContinue(step: index));
            },
            onStepContinue: () {
              if (bloc.state.currentIndex == BASIC_INFO_STEP) {
                if (_formKeyBasicDetails.currentState!.validate()) {
                  bloc.add(OnStepContinue());
                }
              } else if (state.currentIndex == PRODUCT_ENTRY_STEP) {
                if (state.invoiceProductList.isNotEmpty) {
                  bloc.add(CreateDraftInvoice());
                  if (state.invoice != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DraftInvoicePage(
                                  invoice: state.invoice!,
                                )));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Add atleast one product')));
                }
              }
            },
            steps: [
              Step(
                  isActive: (state.currentIndex == BASIC_INFO_STEP),
                  title: Text("Basic"),
                  content: AddInvoiceBasicInfo(
                    formKey: _formKeyBasicDetails,
                    today: today,
                    customerList: bloc.state.companylist,
                  )),
              Step(
                  isActive: (state.currentIndex == PRODUCT_ENTRY_STEP),
                  title: Text("Add Products"),
                  content: BlocProvider.value(
                      value: bloc, child: AddProductContent()))
            ],
            currentStep: bloc.state.currentIndex,
          );
        });
  }
}

class AddInvoiceBasicInfo extends StatefulWidget {
  const AddInvoiceBasicInfo({
    Key? key,
    required this.today,
    required this.customerList,
    required this.formKey,
  }) : super(key: key);

  final List<Company> customerList;

  final DateTime today;

  final GlobalKey<FormState> formKey;

  @override
  State<AddInvoiceBasicInfo> createState() => _AddInvoiceBasicInfoState();
}

class _AddInvoiceBasicInfoState extends State<AddInvoiceBasicInfo> {
  late final TextEditingController _dateController;
  late final TextEditingController _companyController;
  late final FocusNode _dateFocusNode;
  late final FocusNode _companyFocusNode;

  @override
  void initState() {
    _companyController = TextEditingController();
    _dateController = TextEditingController();
    _dateFocusNode = FocusNode();
    _companyFocusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime date = widget.today;
    _dateController.text = date.toDateString();
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomAutoComplete<Company>(
            validator: (value) {
              if (context.read<NewInvoiceBloc>().state.company == null ||
                  context.read<NewInvoiceBloc>().state.company!.name != value) {
                return "please select an option";
              }
            },
            textInputAction: TextInputAction.next,
            controller: _companyController,
            focusNode: _companyFocusNode,
            onSelected: (option) {
              context
                  .read<NewInvoiceBloc>()
                  .add(CompanySelected(company: option));
              _companyFocusNode.nextFocus();
            },
            options: widget.customerList,
            labelText: "Customer",
            displayStringForOption: (company) => company.name,
          ),
          SizedBox(
            height: 15,
          ),
          DateTimeFormField(
            mode: DateTimeFieldPickerMode.date,
            firstDate: widget.today.subtract(Duration(days: 31)),
            initialDate: widget.today,
            lastDate: widget.today.add(Duration(days: 31)),
            onDateSelected: (date) {
              context.read<NewInvoiceBloc>().add(DateSelected(date: date));
            },
            decoration: InputDecoration(labelText: "Date"),
            validator: (date) {
              if (context.read<NewInvoiceBloc>().state.date == null ||
                  context.read<NewInvoiceBloc>().state.date != date) {
                return "please select a date";
              }
            },
          )
          // TextFormField(
          //   focusNode: _dateFocusNode,
          //   textInputAction: TextInputAction.done,
          //   controller: _dateController,
          //   keyboardType: TextInputType.datetime,
          //   decoration: InputDecoration(
          //       constraints: BoxConstraints(maxHeight: 60),
          //       prefixText: "Date : ",
          //       suffix: IconButton(
          //         padding: EdgeInsets.all(2),
          //         icon: Icon(Icons.calendar_today_outlined),
          //         onPressed: () async {
          //           final dated = await showDatePicker(
          //             context: context,
          //             firstDate: widget.today.subtract(Duration(days: 31)),
          //             initialDate: widget.today,
          //             lastDate: widget.today.add(Duration(days: 31)),
          //           );
          //           if (dated != null) {
          //             context
          //                 .read<NewInvoiceBloc>()
          //                 .add(DateSelected(date: dated));
          //             date = dated;
          //           }
          //         },
          //       )),
          // )
        ],
      ),
    );
  }
}

class AddProductContent extends StatelessWidget {
  const AddProductContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<NewInvoiceBloc>();
    List<InvoiceProduct> invoiceProducts = bloc.state.invoiceProductList;
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: () {
                showAddProductDialog(context.read<NewInvoiceBloc>(), context);
              },
              child: Text("Add")),
        ),
        (invoiceProducts.isEmpty)
            ? Text("No Products Added")
            : ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 250),
                child: ListView.builder(
                    itemCount: invoiceProducts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          "${invoiceProducts[index].product.name}",
                          softWrap: true,
                        ),
                      );
                    }),
              ),
      ],
    );
  }

  showAddProductDialog(
    NewInvoiceBloc bloc,
    BuildContext pContext,
  ) {
    showDialog(
        context: pContext,
        builder: (context) {
          return BlocProvider<NewInvoiceBloc>.value(
              value: bloc,
              child: AddProductDialog(
                  dialogContext: context, parentContext: pContext));
        });
  }
}
