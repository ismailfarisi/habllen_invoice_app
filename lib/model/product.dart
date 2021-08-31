import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int ProductId;
  final double price;
  final String hsnCode;

  Product(this.ProductId, this.price, this.hsnCode);

  @override
  List<Object?> get props => [];
}
