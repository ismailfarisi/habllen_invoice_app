import 'package:equatable/equatable.dart';
import 'package:googleapis/content/v2_1.dart';

class InvoiceDetails extends Equatable {
  final int? invoiceNo;
  final String? clientName;
  final String? date;
  final double? amount;
  final int? paymentStatus;

  InvoiceDetails(this.invoiceNo, this.clientName, this.date, this.amount,
      this.paymentStatus);

  @override
  List<Object?> get props =>
      [invoiceNo, clientName, date, amount, paymentStatus];
}

class InvoiceDetailsList extends Equatable {
  final List<InvoiceDetails> invoiceDetailList;

  InvoiceDetailsList(this.invoiceDetailList);
  @override
  List<Object?> get props => [invoiceDetailList];

  factory InvoiceDetailsList.fromJson(List? json) {
    final List<InvoiceDetails> list = [];
    InvoiceDetails invoiceDetails;
    for (var value in json!) {
      var paymentstatus;
      switch (value[5]) {
        case "open":
          paymentstatus = 0;
          break;
        case "closed":
          paymentstatus = 2;
          break;
        case "partial":
          paymentstatus = 1;
          break;
      }
      invoiceDetails = InvoiceDetails(int.parse(value[1]), value[3], value[2],
          double.parse(value[4].toString().replaceAll(",", "")), paymentstatus);
      list.add(invoiceDetails);
    }
    return InvoiceDetailsList(list);
  }
}
