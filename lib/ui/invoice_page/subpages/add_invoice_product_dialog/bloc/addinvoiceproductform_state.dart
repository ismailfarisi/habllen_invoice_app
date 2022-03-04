part of 'addinvoiceproductform_bloc.dart';

enum ProductFetchStatus { loading, loaded, error }

class AddinvoiceproductformState extends Equatable {
  const AddinvoiceproductformState(
      {this.productList = const [],
      this.product = const InputProduct.pure(),
      this.price = const InputAccounts.pure(),
      this.quantity = const InputAccounts.pure(1),
      this.status = FormzStatus.pure,
      this.fetchStatus = ProductFetchStatus.loading,
      this.invoiceProduct});

  final List<Product> productList;
  final InputProduct product;
  final InputAccounts price;
  final InputAccounts quantity;
  final FormzStatus status;
  final ProductFetchStatus fetchStatus;
  final InvoiceProduct? invoiceProduct;

  @override
  List<Object?> get props => [
        productList,
        product,
        price,
        quantity,
        status,
        fetchStatus,
        invoiceProduct
      ];

  AddinvoiceproductformState copyWith(
      {List<Product>? productList,
      InputProduct? product,
      InputAccounts? price,
      InputAccounts? quantity,
      FormzStatus? status,
      ProductFetchStatus? fetchStatus,
      InvoiceProduct? invoiceProduct}) {
    return AddinvoiceproductformState(
      productList: productList ?? this.productList,
      product: product ?? this.product,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      status: status ?? this.status,
      fetchStatus: fetchStatus ?? this.fetchStatus,
      invoiceProduct: invoiceProduct ?? this.invoiceProduct,
    );
  }
}
