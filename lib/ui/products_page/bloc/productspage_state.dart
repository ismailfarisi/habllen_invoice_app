part of 'productspage_bloc.dart';

enum Status { initial, success, failed }

class ProductspageState extends Equatable {
  const ProductspageState({
    this.hasReachedMax = false,
    this.productList = const [],
    this.fetchProductStatus = Status.initial,
    this.deleteProductStatus = Status.initial,
  });

  final List<Product> productList;
  final Status fetchProductStatus;
  final Status deleteProductStatus;
  final bool hasReachedMax;

  @override
  List<Object> get props =>
      [productList, fetchProductStatus, deleteProductStatus, hasReachedMax];

  ProductspageState copyWith(
      {List<Product>? productList,
      Status? fetchProductStatus,
      Status? deleteProductStatus,
      bool? hasReachedMax}) {
    return ProductspageState(
        deleteProductStatus: deleteProductStatus ?? this.deleteProductStatus,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        productList: productList ?? this.productList,
        fetchProductStatus: fetchProductStatus ?? this.fetchProductStatus);
  }
}
