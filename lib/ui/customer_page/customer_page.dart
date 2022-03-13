import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:habllen/model/customer.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/ui/customer_page/subpages/add_customer_dialog/add_customer_form.dart';
import 'package:habllen/ui/settings_page/settings_page.dart';

import 'bloc/customer_bloc.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({Key? key}) : super(key: key);
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

class ScaffoldBody extends StatefulWidget {
  const ScaffoldBody({
    Key? key,
  }) : super(key: key);

  @override
  State<ScaffoldBody> createState() => _ScaffoldBodyState();
}

class _ScaffoldBodyState extends State<ScaffoldBody> {
  late final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    context.read<CustomerBloc>()..add(Started());
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: BlocBuilder<CustomerBloc, CustomerState>(
        builder: (context, state) {
          return ListView.builder(
            controller: _scrollController,
            itemBuilder: (context, index) {
              return (index >= state.customerList.length)
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                    )
                  : CustomerTile(
                      customer: state.customerList[index],
                      index: index,
                    );
            },
            itemCount: state.hasReachedMax
                ? state.customerList.length
                : state.customerList.length + 1,
          );
        },
      ),
    );
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<CustomerBloc>().add(LoadMore());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

class CustomerTile extends StatelessWidget {
  const CustomerTile({
    Key? key,
    required this.customer,
    required this.index,
  }) : super(key: key);

  final Customer customer;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            context
                .read<CustomerBloc>()
                .add(DeleteCustomer(customer: customer, customerIndex: index));
          },
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
        SlidableAction(
          onPressed: (context) {
            final bloc = context.read<CustomerBloc>();
            context.pushNamed(AddCustomerPage.routeName,
                extra: AddCustomerPageArguments(
                    customer: customer, customerBloc: bloc));
          },
          backgroundColor: Theme.of(context).colorScheme.secondary,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Edit',
        ),
      ]),
      child: Card(
          elevation: 2,
          child: ListTile(
            onTap: () {
              context.pushNamed("customer_detail_page", extra: customer);
            },
            title: Text(customer.name),
            subtitle: Text(customer.addressOne),
          )),
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
      heroTag: "add_customer_dialog_btn",
      onPressed: () {
        context.goNamed(AddCustomerPage.routeName,
            extra: AddCustomerPageArguments(
                customerBloc: context.read<CustomerBloc>()));
      },
      child: Icon(Icons.add),
    );
  }
}
