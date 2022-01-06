part of 'addproductform_bloc.dart';

class AddProductFormEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class Submitted extends AddProductFormEvent {}

class ProductNameChanged extends AddProductFormEvent {
  final String name;

  ProductNameChanged(this.name);
}

class ProductNameUnFocused extends AddProductFormEvent {}

class HsnCodeChanged extends AddProductFormEvent {
  final String hsnCode;

  HsnCodeChanged(this.hsnCode);
}

class HsnCodeUnFocused extends AddProductFormEvent {}

class PriceChanged extends AddProductFormEvent {
  final String price;

  PriceChanged(this.price);
}

class PriceUnFocused extends AddProductFormEvent {}

class StockChanged extends AddProductFormEvent {
  final String stock;

  StockChanged(this.stock);
}

class StockUnFocused extends AddProductFormEvent {}

class ProductCodeChanged extends AddProductFormEvent {
  final String code;

  ProductCodeChanged(this.code);
}

class ProductCodeUnFocused extends AddProductFormEvent {}
