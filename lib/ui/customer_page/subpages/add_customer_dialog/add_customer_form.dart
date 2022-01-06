import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/shared/widgets/text_field_widget.dart';
import 'package:habllen/shared/utils/formz_extension.dart' show Validator;
import 'package:habllen/ui/customer_page/bloc/customer_bloc.dart';

import 'bloc/customer_form_bloc.dart';

class AddCustomerDialog extends StatelessWidget {
  const AddCustomerDialog({Key? key, required this.customerBloc})
      : super(key: key);
  final CustomerBloc customerBloc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerFormBloc(
          repository: context.read<Repository>(), customerBloc: customerBloc),
      child: AddCustomerForm(),
    );
  }
}

class AddCustomerForm extends StatelessWidget {
  AddCustomerForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Add New Customer",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              AddCustomerDialogContent(),
              ActionButtons()
            ],
          ),
        ),
      ),
    );
  }
}

class AddCustomerDialogContent extends StatefulWidget {
  const AddCustomerDialogContent({Key? key}) : super(key: key);

  @override
  State<AddCustomerDialogContent> createState() =>
      _AddCustomerDialogContentState();
}

class _AddCustomerDialogContentState extends State<AddCustomerDialogContent> {
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
    final state = context.select((CustomerFormBloc element) => element.state);
    return Form(
        child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            validator: (value) => state.name.validation(),
            errorText: state.name.validation(),
            helperText: "Customer Name",
            focusNode: _nameFocusNode,
            textInputAction: TextInputAction.next,
            onChanged: (name) =>
                context.read<CustomerFormBloc>().add(NameChanged(name)),
          ),
          CustomTextField(
            validator: (value) => state.addressOne.validation(),
            errorText: state.addressOne.validation(),
            helperText: "Address line 1",
            focusNode: _addressOneFocusNode,
            textInputAction: TextInputAction.next,
            onChanged: (addressOne) => context
                .read<CustomerFormBloc>()
                .add(AddressOneChanged(addressOne)),
          ),
          CustomTextField(
            validator: (value) => state.addressTwo.validation(),
            errorText: state.addressTwo.validation(),
            helperText: "Address line 2",
            focusNode: _addressTwoFocusNode,
            textInputAction: TextInputAction.next,
            onChanged: (addressTwo) => context
                .read<CustomerFormBloc>()
                .add(AddressTwoChanged(addressTwo)),
          ),
          CustomTextField(
            validator: (value) => state.gst.validation(),
            errorText: state.gst.validation(),
            helperText: "GST",
            focusNode: _gstFocusNode,
            onChanged: (gst) =>
                context.read<CustomerFormBloc>().add(GstChanged(gst)),
          ),
        ],
      ),
    ));
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
