part of 'productspage_bloc.dart';

enum Status { initial, success, failed }

class ProductspageState extends Equatable {
  const ProductspageState(
      {this.productList = const [], this.fetchProductStatus = Status.initial});

  final List<Product> productList;
  final Status fetchProductStatus;

  @override
  List<Object> get props => [productList];

  ProductspageState copyWith(
      {List<Product>? productList, Status? fetchProductStatus}) {
    return ProductspageState(
        productList: productList ?? this.productList,
        fetchProductStatus: fetchProductStatus ?? this.fetchProductStatus);
  }
}
