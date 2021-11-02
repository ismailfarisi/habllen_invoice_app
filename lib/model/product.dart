import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int? id;
  final String name;
  final double price;
  final String hsnCode;
  final double currentStock;

  Product({
    this.id,
    required this.name,
    required this.price,
    required this.hsnCode,
    required this.currentStock,
  });

  @override
  List<Object?> get props => [id, name, price, hsnCode, currentStock];

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["id"],
        price: json["price"],
        hsnCode: json["hsnCode"],
        currentStock: json["currentStock"],
        name: json["name"]);
  }
  Map<String, dynamic> toJson() => _productToJson(this);
}

Map<String, dynamic> _productToJson(Product product) {
  return <String, dynamic>{
    "id": product.id,
    "name": product.name,
    "price": product.price,
    "hsnCode": product.hsnCode,
    "currentStock": product.currentStock
  };
}
