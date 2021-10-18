import 'package:equatable/equatable.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/model/product.dart';

class Invoice extends Equatable {
  final int invoiceId;
  final Company company;
  final List<Product> product;

  Invoice(this.invoiceId, this.company, this.product);

  @override
  List<Object?> get props => [invoiceId, company, product];

  factory Invoice.fromjson(Map<String, dynamic> json) {
    return Invoice(json["id"], json["company"], json["product"]);
  }
}
