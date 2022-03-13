part of 'invoice_product_detail_bloc.dart';

@freezed
class InvoiceProductDetailState with _$InvoiceProductDetailState {
  factory InvoiceProductDetailState({
    required String name,
    @Default(InputAccounts.pure()) InputAccounts price,
    @Default(InputAccounts.pure()) InputAccounts quantity,
    @Default(FormzStatus.pure) FormzStatus status,
  }) = _InvoiceProductDetailState;
  factory InvoiceProductDetailState.initial(InvoiceProduct? product,
      AddinvoiceproductformBloc? addinvoiceproductformBloc) {
    if (addinvoiceproductformBloc != null) {
      final Product product = addinvoiceproductformBloc.state.product.value!;
      return InvoiceProductDetailState(
        name: product.name,
        price: InputAccounts.pure(product.price),
        quantity: InputAccounts.pure(),
        status: FormzStatus.pure,
      );
    }
    if (product != null) {
      return InvoiceProductDetailState(
        name: product.product.name,
        price: InputAccounts.pure(product.price),
        quantity: InputAccounts.pure(product.quantity),
        status: FormzStatus.pure,
      );
    }
    return InvoiceProductDetailState(
      name: "",
      price: InputAccounts.pure(),
      quantity: InputAccounts.pure(),
      status: FormzStatus.pure,
    );
  }
}
