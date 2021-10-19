import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/ui/customer_page/cubit/customer_cubit.dart';
import 'package:habllen/ui/customer_page/widgets/add_customer_form.dart';

class CustomerPage extends StatelessWidget {
  final cubit = CustomerCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyFloatingButton(),
    );
  }
}

class MyFloatingButton extends StatelessWidget {
  const MyFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showAddCustomerDialog(context);
      },
      child: Icon(Icons.add),
    );
  }

  Future showAddCustomerDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (bcontext) {
          return BlocProvider(
            create: (context) => CustomerCubit(),
            child: AddCustomerForm(),
          );
        });
  }
}
