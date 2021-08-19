import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String productName;
  final String hsnCode;
  final double price;
  final double? stock;

  Product(this.id, this.productName, this.hsnCode, this.price, this.stock);

  @override
  List<Object?> get props {
    return [
      id,
      productName,
      hsnCode,
      price,
      stock,
    ];
  }

  @override
  bool get stringify => true;
}
