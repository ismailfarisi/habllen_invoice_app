import 'package:equatable/equatable.dart';
import 'package:habllen/model/company.dart';

import 'invoice_product.dart';

class Invoice extends Equatable {
  final String? id;
  final int invoiceNo;
  final Company company;
  final DateTime date;
  final List<InvoiceProduct> product;

  const Invoice(
      {required this.invoiceNo,
      this.id,
      required this.company,
      this.product = const [],
      required this.date});

  @override
  List<Object?> get props => [id, company, product, date];

  factory Invoice.fromjson(Map<String, dynamic> json) {
    return Invoice(
        id: json["id"],
        invoiceNo: json["invoiceNo"],
        company: json["company"],
        product: json["product"],
        date: json["date"]);
  }
  Map<String, dynamic> toJson() => _invoicetojson(this);
}

Map<String, dynamic> _invoicetojson(Invoice invoice) {
  final productList = invoice.product.map((e) => e.toJson()).toList();

  return <String, dynamic>{
    "invoiceNo": invoice.invoiceNo,
    "company": invoice.company.toJson(),
    "product": productList,
    "date": invoice.date
  };
}
