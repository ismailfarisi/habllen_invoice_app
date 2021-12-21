import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:habllen/model/company.dart';

import 'invoice_product.dart';

enum PaymentStatus { open, closed, partial }

class Invoice extends Equatable {
  final String? id;
  final int invoiceNo;
  final Company company;
  final DateTime date;
  final List<InvoiceProduct> product;
  final double? price;
  final double? iGST;
  final double? cGST;
  final double? sGST;
  final double? totalPrice;
  final PaymentStatus paymentStatus;

  const Invoice({
    required this.invoiceNo,
    this.id,
    required this.company,
    this.product = const [],
    required this.date,
    this.price,
    this.iGST,
    this.cGST,
    this.sGST,
    this.totalPrice,
    required this.paymentStatus,
  });

  @override
  List<Object?> get props => [
        id,
        company,
        product,
        date,
        price,
        iGST,
        cGST,
        sGST,
        totalPrice,
        paymentStatus,
        invoiceNo
      ];

  factory Invoice.fromjson(Map<String, dynamic> jsons) {
    PaymentStatus status;
    print(jsons);
    switch (jsons["paymentStatus"]) {
      case "open":
        status = PaymentStatus.open;
        break;
      case "closed":
        status = PaymentStatus.closed;
        break;
      case "partial":
        status = PaymentStatus.partial;
        break;
      default:
        status = PaymentStatus.closed;
    }
    List<InvoiceProduct> products = (jsons['product'] as List)
        .map((e) => InvoiceProduct.fromJson(e))
        .toList();
    final DateTime dateTime = (jsons["date"] as Timestamp).toDate();
    print(products);
    return Invoice(
        invoiceNo: jsons["invoiceNo"],
        company: Company.fromjson(jsons["company"]),
        product: products,
        date: dateTime,
        price: jsons["price"],
        iGST: jsons["iGST"],
        cGST: jsons['cGST'],
        sGST: jsons["sGST"],
        totalPrice: jsons["totalPrice"],
        paymentStatus: status);
  }
  Map<String, dynamic> toJson() => _invoicetojson(this);
}

Map<String, dynamic> _invoicetojson(Invoice invoice) {
  final productList = invoice.product.map((e) => e.toJson()).toList();

  return <String, dynamic>{
    "invoiceNo": invoice.invoiceNo,
    "company": invoice.company.toJson(),
    "product": productList,
    "date": invoice.date,
    "price": invoice.price,
    "iGST": invoice.iGST,
    "cGST": invoice.cGST,
    "sGST": invoice.sGST,
    "totalPrice": invoice.totalPrice,
    'paymentStatus': invoice.paymentStatus.toString().split(".").last,
  };
}
