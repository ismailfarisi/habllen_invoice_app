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
        hsnCode: json["hsnCode"].toString().toUpperCase(),
        currentStock: json["currentStock"],
        name: json["name"].toString().toUpperCase());
  }
  Map<String, dynamic> toJson() => _productToJson(this);

  Product update(
      {String? name,
      double? price,
      String? hsnCode,
      double? currentStock,
      int? id}) {
    return Product(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        hsnCode: hsnCode ?? this.hsnCode,
        currentStock: currentStock ?? this.currentStock);
  }
}

Map<String, dynamic> _productToJson(Product product) {
  return <String, dynamic>{
    "id": product.id,
    "name": product.name.toLowerCase(),
    "price": product.price,
    "hsnCode": product.hsnCode.toLowerCase(),
    "currentStock": product.currentStock
  };
}
