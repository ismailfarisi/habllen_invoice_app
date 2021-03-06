import 'package:equatable/equatable.dart';
import 'package:habllen/model/product.dart';

class InvoiceProduct extends Equatable {
  final String? id;
  final Product product;
  final double? price;
  final double quantity;
  final double? totalPrice;

  InvoiceProduct({
    this.id,
    this.price,
    required this.quantity,
    required this.product,
    this.totalPrice,
  });

  @override
  List<Object?> get props => [id, product, price, quantity, totalPrice];

  factory InvoiceProduct.fromJson(Map<String, dynamic> json) => _fromJson(json);

  Map<String, dynamic> toJson() => _toJson(this);
}

_fromJson(Map<String, dynamic> json) {
  return InvoiceProduct(
      product: Product.fromJson(json['product']),
      quantity: double.tryParse(json['quantity'].toString()) ?? 0.0,
      price: double.tryParse(json["price"].toString()),
      totalPrice: double.tryParse(json["totalPrice"].toString()) ?? 0.0);
}

Map<String, dynamic> _toJson(InvoiceProduct invoiceProduct) {
  return <String, dynamic>{
    "id": "",
    "product": invoiceProduct.product.toJson(),
    "price": invoiceProduct.price,
    "quantity": invoiceProduct.quantity,
    "totalPrice": invoiceProduct.totalPrice
  };
}
