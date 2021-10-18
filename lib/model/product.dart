import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final double price;
  final String hsnCode;
  final double CurrentStock;

  Product(this.id, this.price, this.hsnCode, this.CurrentStock);

  @override
  List<Object?> get props => [];

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        json["id"], json["price"], json["hsnCode"], json["currentStock"]);
  }
}
