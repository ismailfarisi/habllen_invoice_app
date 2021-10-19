import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/ui/customer_page/cubit/customer_cubit.dart';

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

  @override
  void initState() {
    _namecontroller = TextEditingController();
    _addressOneController = TextEditingController();
    _addressTwoController = TextEditingController();
    _gstController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CustomerCubit>();
    if (cubit.state == CustomerState.loading()) {
      return AlertDialog(
        content: CircularProgressIndicator(),
      );
    } else if (cubit.state == CustomerState.success()) {
      Navigator.pop(context);
    }
    return AlertDialog(
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel")),
        ElevatedButton(
            onPressed: () {
              context.read<CustomerCubit>().name = _namecontroller.text;
              context.read<CustomerCubit>().addressOne =
                  _addressOneController.text;
              context.read<CustomerCubit>().addressTwo =
                  _addressTwoController.text;
              context.read<CustomerCubit>().gst = _gstController.text;
              context.read<CustomerCubit>().addCustomer();
            },
            child: Text("Add"))
      ],
      content: Form(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _namecontroller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _addressOneController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _addressTwoController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _gstController,
            ),
          ),
        ],
      )),
    );
  }
}
