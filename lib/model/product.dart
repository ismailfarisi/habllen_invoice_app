import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? id;
  final int? code;
  final String name;
  final double price;
  final String hsnCode;
  final double currentStock;
  final double gstPercentage;

  Product({
    required this.gstPercentage,
    this.id,
    this.code,
    required this.name,
    required this.price,
    required this.hsnCode,
    required this.currentStock,
  });

  @override
  List<Object?> get props =>
      [id, name, price, hsnCode, currentStock, code, gstPercentage];

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        gstPercentage: (json["gstPercentage"] as num?)?.toDouble() ?? 0.0,
        id: json["id"],
        code: json["code"],
        price: (json["price"] as num?)?.toDouble() ?? 0.0,
        hsnCode: json["hsnCode"].toString().toUpperCase(),
        currentStock: (json["currentStock"] as num?)?.toDouble() ?? 0.0,
        name: json["name"].toString().toUpperCase());
  }
  Map<String, dynamic> toJson() => _productToJson(this);

  Product copyWith(
      {String? name,
      double? price,
      String? hsnCode,
      double? currentStock,
      int? code,
      String? id,
      double? gstPercentage}) {
    return Product(
        gstPercentage: gstPercentage ?? this.gstPercentage,
        id: id ?? this.id,
        code: code ?? this.code,
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
    "currentStock": product.currentStock,
    "code": product.code,
    "gstPercentage": product.gstPercentage
  };
}
