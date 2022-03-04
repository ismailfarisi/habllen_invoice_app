import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:habllen/model/invoice_product.dart';
import 'package:habllen/model/product.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/shared/forms_validator/validator.dart';
import 'package:habllen/ui/invoice_page/invoice_detail_bloc/invoice_detail_bloc.dart';

part 'addinvoiceproductform_event.dart';
part 'addinvoiceproductform_state.dart';

class AddinvoiceproductformBloc
    extends Bloc<AddinvoiceproductformEvent, AddinvoiceproductformState> {
  AddinvoiceproductformBloc({required this.repository, required this.bloc})
      : super(AddinvoiceproductformState()) {
    on<ProductSelected>(_onProductSelected);
    on<ProductFocused>(_onProductFocused);
    on<ProductUnFocused>(_onProductUnfocused);
    on<PriceChanged>(_onPriceChanged);
    on<PriceUnFocused>(_onPriceUnfocused);
    on<QuantityChanged>(_onQuantityChanged);
    on<QuantityUnFocused>(_onQuantityUnfocused);
    on<Submitted>(_onSubmitted);
    on<FetchProducts>(_onFetchProducts);
    on<InvoiceProductCreated>(_onInvoiceProductCreated);
  }
  final Repository repository;
  final InvoiceDetailBloc bloc;
  FutureOr<void> _onProductSelected(
      ProductSelected event, Emitter<AddinvoiceproductformState> emit) {
    final product = InputProduct.dirty(event.product);
    final price = InputAccounts.dirty(event.product.price);
    emit(state.copyWith(
        status: Formz.validate([product, state.price, state.quantity]),
        product: product,
        price: price));
  }

  FutureOr<void> _onProductFocused(
      ProductFocused event, Emitter<AddinvoiceproductformState> emit) async {
    if (state.productList.isEmpty) {
      try {
        final result = await repository.getProducts();
        result.when(
          success: (productList) => emit(state.copyWith(
              productList: productList,
              fetchStatus: ProductFetchStatus.loaded)),
          error: (e) =>
              emit(state.copyWith(fetchStatus: ProductFetchStatus.error)),
        );
      } on Exception catch (e) {
        print(e);
      }
    }
  }

  FutureOr<void> _onProductUnfocused(
      ProductUnFocused event, Emitter<AddinvoiceproductformState> emit) {
    final product = InputProduct.dirty(state.product.value);
    final price = InputAccounts.dirty(state.product.value?.price);
    emit(state.copyWith(
        status: Formz.validate([product, state.price, state.quantity]),
        product: product,
        price: price));
  }

  FutureOr<void> _onPriceChanged(
      PriceChanged event, Emitter<AddinvoiceproductformState> emit) {
    final price = InputAccounts.dirty(double.tryParse(event.price));
    emit(state.copyWith(
        price: price,
        status: Formz.validate([state.product, price, state.quantity])));
  }

  FutureOr<void> _onPriceUnfocused(
      PriceUnFocused event, Emitter<AddinvoiceproductformState> emit) {
    final price = InputAccounts.dirty(state.price.value);
    emit(state.copyWith(
        price: price,
        status: Formz.validate([price, state.product, state.quantity])));
  }

  FutureOr<void> _onQuantityChanged(
      QuantityChanged event, Emitter<AddinvoiceproductformState> emit) {
    final quantity = InputAccounts.dirty(double.tryParse(event.quantity));
    emit(state.copyWith(
        quantity: quantity,
        status: Formz.validate([state.price, state.product, quantity])));
  }

  FutureOr<void> _onQuantityUnfocused(
      QuantityUnFocused event, Emitter<AddinvoiceproductformState> emit) {
    final quantity = InputAccounts.dirty(state.quantity.value);
    emit(state.copyWith(
        quantity: quantity,
        status: Formz.validate([state.price, state.product, quantity])));
  }

  FutureOr<void> _onSubmitted(
      Submitted event, Emitter<AddinvoiceproductformState> emit) {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final InvoiceProduct invoiceProduct = InvoiceProduct(
          quantity: state.quantity.value!,
          product: state.product.value!,
          price: state.price.value!);
      print(invoiceProduct);
      bloc.add(InvoiceDetailEvent.newProductAdded(invoiceProduct));

      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    }
  }

  FutureOr<void> _onFetchProducts(
      FetchProducts event, Emitter<AddinvoiceproductformState> emit) async {
    if (state.productList.isEmpty) {
      try {
        final result = await repository.getProducts();
        result.when(
          success: (productList) => emit(state.copyWith(
              productList: productList,
              fetchStatus: ProductFetchStatus.loaded)),
          error: (e) =>
              emit(state.copyWith(fetchStatus: ProductFetchStatus.error)),
        );
      } on Exception catch (e) {
        print(e);
      }
    }
  }

  FutureOr<void> _onInvoiceProductCreated(InvoiceProductCreated event,
      Emitter<AddinvoiceproductformState> emit) async {
    final quantity = InputAccounts.dirty(state.quantity.value);
    emit(state.copyWith(
        quantity: quantity,
        status: Formz.validate([state.product, state.price, quantity])));
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final quantity = state.quantity.value!;
      final price = state.price.value!;
      final InvoiceProduct invoiceProduct = InvoiceProduct(
          quantity: quantity,
          product: state.product.value!,
          price: price,
          totalPrice: price * quantity);
      print(invoiceProduct);
      print(bloc);
      bloc.add(InvoiceDetailEvent.newProductAdded(invoiceProduct));
      emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          invoiceProduct: invoiceProduct));
    }
  }
}
