import 'package:equatable/equatable.dart';
import 'package:sales_api/model/company.dart';
import 'package:sales_api/model/product.dart';

class InvoiceDetails extends Equatable {
  final int? invoiceNo;
  final Company? company;
  final List<Product>? productList;
  final String? date;
  final double? amount;
  final String? paymentStatus;

  InvoiceDetails(this.invoiceNo, this.company, this.productList, this.date,
      this.amount, this.paymentStatus);

  @override
  List<Object?> get props {
    return [
      invoiceNo,
      company,
      productList,
      date,
      amount,
      paymentStatus,
    ];
  }

  factory InvoiceDetails.fromList(List<dynamic> list) {
    final invoiceNo = int.parse(list[1].toString());
    final company = Company(companyName: list[3].toString());
    final productList = null;
    final date = list[2].toString();
    final amount = double.parse(list[4].toString().replaceAll(",", ""));
    final paymentStatus = list[5].toString();

    return InvoiceDetails(
        invoiceNo, company, productList, date, amount, paymentStatus);
  }
}
