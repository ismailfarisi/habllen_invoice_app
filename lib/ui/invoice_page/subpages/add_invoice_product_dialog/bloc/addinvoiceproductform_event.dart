part of 'addinvoiceproductform_bloc.dart';

class AddinvoiceproductformEvent extends Equatable {
  const AddinvoiceproductformEvent();

  @override
  List<Object> get props => [];
}

class Submitted extends AddinvoiceproductformEvent {}

class ProductFocused extends AddinvoiceproductformEvent {}

class ProductUnFocused extends AddinvoiceproductformEvent {}

class ProductSelected extends AddinvoiceproductformEvent {
  final Product product;

  ProductSelected(this.product);
}

class QuantityChanged extends AddinvoiceproductformEvent {
  final String quantity;

  QuantityChanged(this.quantity);
}

class QuantityUnFocused extends AddinvoiceproductformEvent {}

class PriceChanged extends AddinvoiceproductformEvent {
  final String price;

  PriceChanged(this.price);
}

class PriceUnFocused extends AddinvoiceproductformEvent {}
