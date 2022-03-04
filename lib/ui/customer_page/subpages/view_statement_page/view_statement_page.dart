import 'package:flutter/material.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/model/payment.dart';
import 'package:habllen/ui/customer_page/subpages/view_statement_page/cubit/view_statement_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing/printing.dart';

class ViewStatementPage extends StatelessWidget {
  const ViewStatementPage({Key? key}) : super(key: key);
  static const String routeName = 'view_statement_page';

  @override
  Widget build(BuildContext context) {
    context.read<ViewStatementPageCubit>().initiated();
    return Scaffold(
      appBar: AppBar(
        title: Text('View Statement'),
      ),
      body: BlocBuilder<ViewStatementPageCubit, ViewStatementPageState>(
        builder: (context, state) {
          return PdfPreview(
            build: (pageFormat) => state.pdfData!,
          );
        },
      ),
    );
  }
}

class ViewStatementPageArguments {
  final List<Payment> paymentList;
  final List<Invoice> invoiceList;
  final Customer customer;

  ViewStatementPageArguments(
      {required this.paymentList,
      required this.invoiceList,
      required this.customer});
}
