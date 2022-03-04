import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/model/payment.dart';
import 'package:habllen/model/statement.dart';
import 'package:habllen/shared/pdf_statement_maker.dart';

part 'view_statement_page_state.dart';
part 'view_statement_page_cubit.freezed.dart';

class ViewStatementPageCubit extends Cubit<ViewStatementPageState> {
  ViewStatementPageCubit(
      {required this.paymentList,
      required this.invoiceList,
      required this.customer})
      : super(ViewStatementPageState());
  final List<Payment> paymentList;
  final List<Invoice> invoiceList;
  final Customer customer;

  void initiated() async {
    final List<Statement> statementList = paymentList
        .map((payment) => Statement(
              date: payment.date,
              description: payment.remarks.toString(),
              credit: payment.amount,
              debit: 0.0,
            ))
        .toList()
      ..addAll(invoiceList
          .map((invoice) => Statement(
                date: invoice.date!,
                description: invoice.invoiceNo!.toString(),
                credit: 0.0,
                debit: invoice.totalPrice!,
              ))
          .toList())
      ..sort((a, b) => a.date.compareTo(b.date))
      ..reversed;

    double balance = 0.0;
    final List<Statement> last = statementList.mapIndexed((index, element) {
      balance += element.debit - element.credit;
      return element.copyWith(
        siNo: index + 1,
        balance: balance,
      );
    }).toList();
    print(last);
    final pdf = PdfStatementMaker(
      customer: customer,
      statementList: last,
    );
    await pdf.pdfPageBuilder();
    final pdfData = pdf.getPDFData();
    emit(state.copyWith(pdfData: pdfData));
  }
}
