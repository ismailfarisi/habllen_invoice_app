import 'package:flutter/material.dart';
import 'package:habllen/model/invoice.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/ui/home/home.dart';
import 'package:habllen/ui/invoice_page/subpages/draft_invoice_page/cubit/draftinvoice_cubit.dart';

import 'package:habllen/widgets/invoice_view.dart';

class DraftInvoicePage extends StatelessWidget {
  final Invoice invoice;
  const DraftInvoicePage({Key? key, required this.invoice}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final repo = context.read<Repository>();
    return BlocProvider(
      create: (context) => DraftinvoiceCubit(repository: repo),
      child: DraftInvoiceScaffold(invoice: invoice),
    );
  }
}

class DraftInvoiceScaffold extends StatelessWidget {
  const DraftInvoiceScaffold({
    Key? key,
    required this.invoice,
  }) : super(key: key);

  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (dialogContext) => ConfirmCallBackDialog(
                    onDialogConfirm: () {
                      context.read<DraftinvoiceCubit>().postInvoice(invoice);
                    },
                  ),
              barrierDismissible: false);
        },
        child: Text("POST"),
      ),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocListener<DraftinvoiceCubit, DraftinvoiceState>(
        listener: (context, state) {
          if (state.status == Status.success) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/invoice_details', ModalRoute.withName("/"));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Draft Invoice",
                style: Theme.of(context).textTheme.headline4,
              ),
              Expanded(child: InvoiceViewWidget(invoice: invoice)),
            ],
          ),
        ),
      ),
    );
  }
}

typedef OnDialogConfirm = void Function();

class ConfirmCallBackDialog extends StatelessWidget {
  const ConfirmCallBackDialog({
    Key? key,
    required this.onDialogConfirm,
  }) : super(key: key);

  final OnDialogConfirm onDialogConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(actions: [
      OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("cancel")),
      ElevatedButton(onPressed: onDialogConfirm, child: Text("Add")),
    ], content: Text("Press comfirm to comfirm this"));
  }
}
