import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:habllen/model/company.dart';

import 'invoice_product.dart';

enum PaymentStatus { open, closed, partial }

class Invoice extends Equatable {
  final String? id;
  final int? invoiceNo;
  final Customer? company;
  final DateTime? date;
  final List<InvoiceProduct> products;
  final double? price;
  final double? tax;
  final double? totalPrice;
  final PaymentStatus paymentStatus;
  final bool? isIgst;

  const Invoice({
    this.tax,
    this.isIgst,
    this.invoiceNo,
    this.id,
    this.company,
    this.products = const [],
    this.date,
    this.price,
    this.totalPrice,
    this.paymentStatus = PaymentStatus.open,
  });

  @override
  List<Object?> get props => [
        id,
        company,
        products,
        date,
        price,
        tax,
        totalPrice,
        paymentStatus,
        invoiceNo,
        isIgst
      ];
  Invoice copyWith({String? id, int? invoiceNo}) {
    return Invoice(
      tax: this.tax,
      price: this.price,
      totalPrice: this.totalPrice,
      paymentStatus: this.paymentStatus,
      invoiceNo: invoiceNo ?? this.invoiceNo,
      id: id ?? this.id,
      company: this.company,
      products: this.products,
      date: this.date,
      isIgst: this.isIgst,
    );
  }

  Invoice addCustomer({required Customer company}) {
    final _isIGST = _checkIsIGST(company.gst);
    double? _tax;
    if (products.isNotEmpty) {
      _tax = _calculateTax(products);
    }
    print("customerrrrrrrrrrrrrrrrrrrrrrrrr$_isIGST");
    return Invoice(
        id: this.id,
        company: company,
        products: this.products,
        date: this.date,
        price: this.price,
        tax: _tax ?? this.tax,
        totalPrice: this.totalPrice,
        paymentStatus: this.paymentStatus,
        invoiceNo: this.invoiceNo,
        isIgst: _isIGST);
  }

  Invoice addProduct({required InvoiceProduct product}) {
    double _tax = this.tax ?? 0;
    double subTotal = this.price ?? 0;
    double total = this.totalPrice ?? 0;

    _tax += (product.totalPrice! * product.product.gstPercentage / 100);
    subTotal += product.totalPrice!;
    total = subTotal + _tax;
    List<InvoiceProduct> products = List.from(this.products)..add(product);

    final invoice = Invoice(
      tax: _tax,
      price: subTotal,
      totalPrice: total,
      paymentStatus: this.paymentStatus,
      invoiceNo: this.invoiceNo,
      id: this.id,
      company: this.company,
      products: products,
      date: this.date,
      isIgst: this.isIgst,
    );
    print("invoice: $invoice");
    return invoice;
  }

  Invoice deleteProduct({required InvoiceProduct product}) {
    final products = List.of(this.products);
    products.removeWhere((element) => element == product);
    final totalTax = _calculateTax(products);
    final invoice = Invoice(
      tax: totalTax,
      price: this.price,
      totalPrice: this.totalPrice,
      paymentStatus: this.paymentStatus,
      invoiceNo: this.invoiceNo,
      id: this.id,
      company: this.company,
      products: products,
      date: this.date,
      isIgst: this.isIgst,
    );
    return invoice;
  }

  Invoice editProduct({required InvoiceProduct product}) {
    final products = List.of(this.products);
    products.map((e) {
      if (e.id == product.id) return product;
    }).toList();
    final totalTax = _calculateTax(products);
    final invoice = Invoice(
      tax: totalTax,
      price: this.price,
      totalPrice: this.totalPrice,
      paymentStatus: this.paymentStatus,
      invoiceNo: this.invoiceNo,
      id: this.id,
      company: this.company,
      products: products,
      date: this.date,
      isIgst: this.isIgst,
    );
    return invoice;
  }

  Invoice changeDate({required DateTime date}) {
    return Invoice(
      tax: this.tax,
      price: this.price,
      totalPrice: this.totalPrice,
      paymentStatus: this.paymentStatus,
      invoiceNo: this.invoiceNo,
      id: this.id,
      company: this.company,
      products: this.products,
      date: date,
      isIgst: this.isIgst,
    );
  }

  Invoice changePaymentStatus({required PaymentStatus paymentStatus}) {
    return Invoice(
      tax: this.tax,
      price: this.price,
      totalPrice: this.totalPrice,
      paymentStatus: paymentStatus,
      invoiceNo: this.invoiceNo,
      id: this.id,
      company: this.company,
      products: this.products,
      date: this.date,
      isIgst: this.isIgst,
    );
  }

  factory Invoice.fromjson(Map<String, dynamic> jsons) {
    PaymentStatus status;
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
    return Invoice(
        id: jsons["id"],
        invoiceNo: jsons["invoiceNo"],
        company: Customer.fromjson(jsons["company"]),
        products: products,
        date: dateTime,
        price: double.tryParse(jsons["price"].toString()) ?? 0.0,
        tax: double.tryParse(jsons["tax"].toString()) ?? 0.0,
        isIgst: jsons["isIgst"] as bool?,
        totalPrice: double.tryParse(jsons["totalPrice"].toString()) ?? 0.0,
        paymentStatus: status);
  }
  Map<String, dynamic> toJson() => _invoicetojson(this);
}

Map<String, dynamic> _invoicetojson(Invoice invoice) {
  final productList = invoice.products.map((e) => e.toJson()).toList();

  return <String, dynamic>{
    "id": invoice.id,
    "invoiceNo": invoice.invoiceNo,
    "company": invoice.company!.toJson(),
    "product": productList,
    "date": Timestamp.fromDate(invoice.date ?? DateTime.now()),
    "price": invoice.price ?? 0.0,
    "tax": invoice.tax ?? 0.0,
    "isIgst": invoice.isIgst,
    "totalPrice": invoice.totalPrice ?? 0.0,
    'paymentStatus': invoice.paymentStatus.toString().split(".").last,
  };
}

double _calculateTax(List<InvoiceProduct> products) {
  double total = 0.0;
  products.forEach((element) {
    total = element.totalPrice! * element.product.gstPercentage / 100;
  });
  return total;
}

bool _checkIsIGST(String conpanyGst) {
  if (conpanyGst.substring(0, 2) != "32") {
    return true;
  }
  return false;
}
