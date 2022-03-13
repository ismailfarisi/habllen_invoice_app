import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habllen/model/customer.dart';
import 'package:habllen/shared/widgets/custom_autocomplete.dart';
import 'package:habllen/shared/widgets/custom_paddings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/ui/customer_page/subpages/add_customer_dialog/add_customer_form.dart';
import 'package:habllen/ui/invoice_page/subpages/add_invoice_customer_page/cubit/add_invoice_customer_page_cubit.dart';

class AddInvoiceCustomerPage extends StatefulWidget {
  const AddInvoiceCustomerPage({Key? key}) : super(key: key);

  static const String routeName = 'add_invoice_customer_dialog';

  @override
  State<AddInvoiceCustomerPage> createState() => _AddInvoiceCustomerPageState();
}

class _AddInvoiceCustomerPageState extends State<AddInvoiceCustomerPage> {
  @override
  void initState() {
    context.read<AddInvoiceCustomerPageCubit>().fethCustomers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return BlocListener<AddInvoiceCustomerPageCubit,
        AddInvoiceCustomerPageState>(
      listener: (context, state) {
        Navigator.pop(context);
      },
      listenWhen: (previous, current) {
        return current.selectedCustomer != previous.selectedCustomer;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('Add Invoice Customer'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalBigSpace(),
              AddNewCustomerButton(),
              VerticalSmallSpace(),
              Divider(
                thickness: 2,
              ),
              VerticalSmallSpace(),
              CustomAutoComplete<Customer>(
                options: context
                    .watch<AddInvoiceCustomerPageCubit>()
                    .state
                    .companies,
                labelText: "company",
                displayStringForOption: (option) => option.name,
                onSelected: (option) => context
                    .read<AddInvoiceCustomerPageCubit>()
                    .customerSelected(option),
              ),
              VerticalSmallSpace(),
              HorizonalPadding(
                child: Text(
                  "Recents",
                  style: textTheme.headline5?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ),
              VerticalBigSpace(),
              Expanded(
                child: ListView.builder(
                    itemCount: context
                        .read<AddInvoiceCustomerPageCubit>()
                        .state
                        .companies
                        .length,
                    itemBuilder: (context, index) {
                      final item = context
                          .read<AddInvoiceCustomerPageCubit>()
                          .state
                          .companies[index];
                      return Card(
                        child: ListTile(
                          onTap: () => context
                              .read<AddInvoiceCustomerPageCubit>()
                              .customerSelected(item),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text(item.name), Text(item.addressOne)],
                          ),
                        ),
                      );
                    }),
              )
            ],
          )),
    );
  }
}

class AddNewCustomerButton extends StatelessWidget {
  const AddNewCustomerButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(AddCustomerPage.routeName);
      },
      child: HorizonalPadding(
        child: Row(children: [
          Icon(
            Icons.add_circle_outline_outlined,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            "create new customer",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ]),
      ),
    );
  }
}
