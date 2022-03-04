import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/shared/widgets/custom_add_field.dart';
import 'package:habllen/ui/customer_page/bloc/customer_bloc.dart';

import 'bloc/customer_form_bloc.dart';

class AddCustomerPage extends StatelessWidget {
  const AddCustomerPage({
    Key? key,
  }) : super(key: key);
  static const String routeName = 'add_customer_full_dialog';

  @override
  Widget build(BuildContext context) {
    return _AddCustomerForm();
  }
}

class _AddCustomerForm extends StatelessWidget {
  _AddCustomerForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomerFormBloc, CustomerFormState>(
      listener: (context, state) {
        Navigator.pop(context);
      },
      listenWhen: (previous, current) =>
          (current.status == FormzStatus.submissionSuccess),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Customer'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  onCheckTapped(context);
                },
                icon: Icon(Icons.check))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: _AddCustomerDialogContent(),
          ),
        ),
      ),
    );
  }

  void onCheckTapped(BuildContext context) {
    context.read<CustomerFormBloc>().add(Submitted());
  }
}

class _AddCustomerDialogContent extends StatefulWidget {
  const _AddCustomerDialogContent({Key? key}) : super(key: key);

  @override
  State<_AddCustomerDialogContent> createState() =>
      _AddCustomerDialogContentState();
}

class _AddCustomerDialogContentState extends State<_AddCustomerDialogContent> {
  late final FocusNode _nameFocusNode = FocusNode();
  late final FocusNode _addressOneFocusNode = FocusNode();
  late final FocusNode _addressTwoFocusNode = FocusNode();
  late final FocusNode _gstFocusNode = FocusNode();

  @override
  void initState() {
    _nameFocusNode.addListener(() {
      if (!_nameFocusNode.hasFocus) {
        context.read<CustomerFormBloc>().add(NameUnFocused());
      }
    });
    _addressOneFocusNode.addListener(() {
      if (!_addressOneFocusNode.hasFocus) {
        context.read<CustomerFormBloc>().add(AddressOneUnFocused());
      }
    });
    _addressTwoFocusNode.addListener(() {
      if (!_addressTwoFocusNode.hasFocus) {
        context.read<CustomerFormBloc>().add(AddressTwoUnFocused());
      }
    });
    _gstFocusNode.addListener(() {
      if (!_gstFocusNode.hasFocus) {
        context.read<CustomerFormBloc>().add(GstUnFocused());
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _addressOneFocusNode.dispose();
    _addressTwoFocusNode.dispose();
    _gstFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final company = context.read<CustomerFormBloc>().state.company;
    return BlocBuilder<CustomerFormBloc, CustomerFormState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAddField(
                value: company?.name,
                fieldName: "Customer Name",
                onChanged: (name) {
                  context.read<CustomerFormBloc>().add(NameChanged(name));
                },
                validator: state.name.error),
            CustomAddField(
                value: company?.addressOne,
                fieldName: "Address 1",
                onChanged: (addressOne) {
                  context
                      .read<CustomerFormBloc>()
                      .add(AddressOneChanged(addressOne));
                },
                validator: state.addressOne.error),
            CustomAddField(
                value: company?.addressTwo,
                fieldName: "Address 2",
                onChanged: (addressTwo) {
                  context
                      .read<CustomerFormBloc>()
                      .add(AddressTwoChanged(addressTwo));
                },
                validator: state.addressTwo.error),
            CustomAddField(
                value: company?.gst,
                fieldName: "Gst",
                onChanged: (gst) {
                  context.read<CustomerFormBloc>().add(GstChanged(gst));
                },
                validator: state.gst.error),
          ],
        );
      },
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<CustomerFormBloc, CustomerFormState>(
            listener: (context, state) => Navigator.pop(context),
            listenWhen: (previous, current) =>
                current.status == FormzStatus.submissionSuccess,
            buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: (state.status == FormzStatus.submissionInProgress)
                    ? [CircularProgressIndicator()]
                    : [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel")),
                        ElevatedButton(
                            onPressed: () {
                              context.read<CustomerFormBloc>().add(Submitted());
                            },
                            child: Text("Add"))
                      ],
              );
            }));
  }
}

class AddCustomerPageArguments {
  final Customer? customer;
  final CustomerBloc? customerBloc;

  AddCustomerPageArguments({this.customer, this.customerBloc});
}
