import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:habllen/model/product.dart';

class InvoiceProduct extends Equatable {
  final int? id;
  final Product product;
  final double? price;
  final double quantity;

  InvoiceProduct(
      {this.id, this.price, required this.quantity, required this.product});

  @override
  List<Object?> get props => [id, product, price, quantity];

  Map<String, dynamic> toJson() => _InvoiceProduct(this);
}

Map<String, dynamic> _InvoiceProduct(InvoiceProduct invoiceProduct) {
  return <String, dynamic>{
    "id": "",
    "product": invoiceProduct.product,
    "price": invoiceProduct.price,
    "quantity": invoiceProduct.quantity
  };
}
