import 'package:equatable/equatable.dart';

class InvoiceProduct extends Equatable {
  final int id;
  final double price;
  final double quantity;

  InvoiceProduct(this.id, this.price, this.quantity);

  @override
  List<Object?> get props => [];
}
