part of 'productspage_bloc.dart';

class ProductsPageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchProducts extends ProductsPageEvent {}

class DeleteProduct extends ProductsPageEvent {
  final Product product;
  final int index;

  DeleteProduct({required this.product, required this.index});
}
