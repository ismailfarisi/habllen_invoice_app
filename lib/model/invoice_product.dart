import 'package:equatable/equatable.dart';

class InvoiceProduct extends Equatable {
  final int InvoiceProductId;
  final double price;
  final double quantity;

  InvoiceProduct(this.InvoiceProductId, this.price, this.quantity);

  @override
  List<Object?> get props => [];
}
