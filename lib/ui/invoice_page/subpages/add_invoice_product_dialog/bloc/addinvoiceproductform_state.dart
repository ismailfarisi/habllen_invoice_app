part of 'addinvoiceproductform_bloc.dart';

enum ProductFetchStatus { loading, loaded, error }

class AddinvoiceproductformState extends Equatable {
  const AddinvoiceproductformState(
      {this.productList = const [],
      this.product = const InputProduct.pure(),
      this.price = const InputAccounts.pure(),
      this.quantity = const InputAccounts.pure(),
      this.status = FormzStatus.pure,
      this.fetchStatus = ProductFetchStatus.loading});

  final List<Product> productList;
  final InputProduct product;
  final InputAccounts price;
  final InputAccounts quantity;
  final FormzStatus status;
  final ProductFetchStatus fetchStatus;

  @override
  List<Object> get props =>
      [productList, product, price, quantity, status, fetchStatus];

  AddinvoiceproductformState copyWith(
      {List<Product>? productList,
      InputProduct? product,
      InputAccounts? price,
      InputAccounts? quantity,
      FormzStatus? status,
      ProductFetchStatus? fetchStatus}) {
    return AddinvoiceproductformState(
      productList: productList ?? this.productList,
      product: product ?? this.product,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      status: status ?? this.status,
      fetchStatus: fetchStatus ?? this.fetchStatus,
    );
  }
}
