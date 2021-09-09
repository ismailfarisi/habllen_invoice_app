import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final double price;
  final String hsnCode;

  Product(this.id, this.price, this.hsnCode);

  @override
  List<Object?> get props => [];
}
