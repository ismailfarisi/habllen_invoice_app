import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/ui/customer_page/cubit/customer_cubit.dart';
import 'package:http/http.dart';

class CustomerPage extends StatelessWidget {
  final cubit = CustomerCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        floatingActionButton: MyFloatingButton(cubit: cubit),
      ),
    );
  }
}

class MyFloatingButton extends StatefulWidget {
  const MyFloatingButton({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final CustomerCubit cubit;

  @override
  State<MyFloatingButton> createState() => _MyFloatingButtonState();
}

class _MyFloatingButtonState extends State<MyFloatingButton> {
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
    return FloatingActionButton(
      onPressed: () {
        showAddCustomerDialog(context, widget.cubit);
      },
      child: Icon(Icons.add),
    );
  }

  Future showAddCustomerDialog(BuildContext context, CustomerCubit cubit) {
    return showDialog(
        context: context,
        builder: (bcontext) {
          CustomerState state = InitialState();
          return StatefulBuilder(
              builder: (BuildContext ccontext, StateSetter istate) {
            istate(() {
              print(state);
              state = ccontext.watch<CustomerCubit>().state;
            });
            if (state is Loading) {
              return CircularProgressIndicator();
            } else if (state is SubmissionSuccess) {
              Navigator.pop(bcontext);
            }
            return AlertDialog(
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(bcontext);
                    },
                    child: Text("Cancel")),
                ElevatedButton(
                    onPressed: () {
                      ccontext.read<CustomerCubit>().name =
                          _namecontroller.text;
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
          });
        });
  }
}
