part of 'productspage_cubit.dart';

class ProductspageState extends Equatable {
  const ProductspageState({this.productList = const []});

  final List<Product> productList;

  @override
  List<Object> get props => [productList];

  ProductspageState copyWith({List<Product>? productList}) {
    return ProductspageState(productList: productList ?? this.productList);
  }
}
