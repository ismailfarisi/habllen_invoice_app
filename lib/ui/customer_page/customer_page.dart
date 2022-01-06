import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/ui/customer_page/subpages/add_customer_dialog/add_customer_form.dart';

import 'bloc/customer_bloc.dart';

class CustomerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerBloc(context.read<Repository>()),
      child: Scaffold(
        floatingActionButton: MyFloatingButton(),
        body: ScaffoldBody(),
      ),
    );
  }
}

class ScaffoldBody extends StatelessWidget {
  const ScaffoldBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CustomerBloc>()..add(Started());

    return BlocBuilder<CustomerBloc, CustomerState>(
      builder: (context, state) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final customer = state.customerList[index];
            return Slidable(
              endActionPane:
                  ActionPane(motion: const StretchMotion(), children: [
                SlidableAction(
                  onPressed: (context) {
                    context.read<CustomerBloc>().add(DeleteCustomer(
                        customer: customer, customerIndex: index));
                  },
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
                SlidableAction(
                  onPressed: (context) {},
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',
                ),
              ]),
              child: Card(
                  elevation: 0,
                  child: ListTile(
                    title: Text(customer.name),
                    subtitle: Text(customer.addressOne),
                  )),
            );
          },
          itemCount: state.customerList.length,
        );
      },
    );
  }
}

class MyFloatingButton extends StatelessWidget {
  const MyFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext bcontext) {
    return FloatingActionButton(
      heroTag: "add_customer_dialog_btn",
      onPressed: () {
        Navigator.push(
            bcontext,
            PageRouteBuilder(
                barrierDismissible: false,
                transitionDuration: const Duration(milliseconds: 600),
                opaque: false,
                barrierColor: Colors.black54,
                pageBuilder: (context, anim1, anim2) {
                  return AddCustomerDialog(
                      customerBloc: bcontext.read<CustomerBloc>());
                }));
      },
      child: Icon(Icons.add),
    );
  }
}
