import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/ui/customer_page/subpages/add_customer_dialog/validator/customer_validator.dart';
import 'package:habllen/shared/widgets/text_field_widget.dart';

import 'cubit/customer_cubit.dart';

class AddCustomerDialog extends StatelessWidget {
  const AddCustomerDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CustomerCubit(), child: AddCustomerForm());
  }
}

class AddCustomerForm extends StatefulWidget {
  const AddCustomerForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddCustomerForm> createState() => _AddCustomerFormState();
}

class _AddCustomerFormState extends State<AddCustomerForm> {
  late final TextEditingController _namecontroller;
  late final TextEditingController _addressOneController;
  late final TextEditingController _addressTwoController;
  late final TextEditingController _gstController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _namecontroller = TextEditingController();
    _addressOneController = TextEditingController();
    _addressTwoController = TextEditingController();
    _gstController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _namecontroller.dispose();
    _addressOneController.dispose();
    _addressTwoController.dispose();
    _gstController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CustomerCubit>();
    final bool isLoading = cubit.state == CustomerState.loading();
    if (cubit.state == CustomerState.success()) Navigator.pop(context);
    return AlertDialog(
      title: Text("Add New Customer"),
      actions: (isLoading)
          ? []
          : [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final name = _namecontroller.text;
                      final addressOne = _addressOneController.text;
                      final addressTwo = _addressTwoController.text;
                      final gst = _gstController.text;
                      final company = Company(
                          name: name,
                          addressOne: addressOne,
                          addressTwo: addressTwo,
                          gst: gst);
                      context.read<CustomerCubit>().addCustomer(company);
                    }
                  },
                  child: Text("Add"))
            ],
      content: (isLoading)
          ? ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                      validator: nameValidator,
                      helperText: "Customer Name",
                      controller: _namecontroller,
                    ),
                    CustomTextField(
                      validator: addressValidator,
                      helperText: "Address line 1",
                      controller: _addressOneController,
                    ),
                    CustomTextField(
                      helperText: "Address line 2",
                      controller: _addressTwoController,
                    ),
                    CustomTextField(
                      validator: gstValidator,
                      helperText: "GST",
                      controller: _gstController,
                    ),
                  ],
                ),
              )),
    );
  }
}
