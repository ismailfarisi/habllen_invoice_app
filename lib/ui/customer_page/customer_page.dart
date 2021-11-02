import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/ui/customer_page/subpages/add_customer_dialog/add_customer_form.dart';

import 'bloc/customer_bloc.dart';

class CustomerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerBloc(),
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
    final bloc = context.watch<CustomerBloc>()..add(WidgetInitiated());
    return ListView.builder(
      itemBuilder: (context, index) {
        final customer = bloc.state.customerList[index];
        return GestureDetector(
          child: Card(
            elevation: 0,
            child: ListTile(
              title: Text("${customer.name}"),
              horizontalTitleGap: 4,
            ),
          ),
        );
      },
      itemCount: bloc.state.customerList.length,
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
        showDialog(
            context: context,
            builder: (context) {
              return AddCustomerDialog();
            });
      },
      child: Icon(Icons.add),
    );
  }
}
