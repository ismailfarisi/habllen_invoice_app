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

class HsnCodeChanged extends AddProductFormEvent {
  final String hsnCode;

  HsnCodeChanged(this.hsnCode);
}

class PriceChanged extends AddProductFormEvent {
  final String price;

  PriceChanged(this.price);
}

class GstPercentageChanged extends AddProductFormEvent {
  final String gstPercentage;

  GstPercentageChanged(this.gstPercentage);
}

class StockChanged extends AddProductFormEvent {
  final String stock;

  StockChanged(this.stock);
}

class ProductCodeChanged extends AddProductFormEvent {
  final String code;

  ProductCodeChanged(this.code);
}
