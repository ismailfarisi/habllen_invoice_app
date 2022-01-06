import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/shared/forms_validator/validator.dart';

part 'addproductform_state.dart';
part 'addproductform_event.dart';

class AddProductFormBloc
    extends Bloc<AddProductFormEvent, AddProductFormState> {
  AddProductFormBloc({required this.repository})
      : super(AddProductFormState()) {
    on<PriceChanged>(_onPriceChanged);
    on<PriceUnFocused>(_onPriceUnFocused);
    on<ProductNameChanged>(_onProductNameChanged);
    on<ProductNameUnFocused>(_onProductNameUnfocused);
    on<ProductCodeChanged>(_onProductCodeChanged);
    on<ProductCodeUnFocused>(_onOroductCodeUnFocused);
    on<StockChanged>(_onStockChanged);
    on<StockUnFocused>(_onStockUnfocused);
    on<HsnCodeChanged>(_onHsnCodeChanged);
    on<HsnCodeUnFocused>(_onHsnCodeUnfocused);
    on<Submitted>(_onSubmitted);
  }

  final Repository repository;

  FutureOr<void> _onPriceChanged(
      PriceChanged event, Emitter<AddProductFormState> emit) {
    try {
      final price = InputAccounts.dirty(double.tryParse(event.price));
      emit(state.copyWith(
          status: Formz.validate(
              [state.productName, state.id, price, state.hsnCode, state.stock]),
          price: price));
    } catch (e) {}
  }

  FutureOr<void> _onPriceUnFocused(
      PriceUnFocused event, Emitter<AddProductFormState> emit) {
    final price = InputAccounts.dirty(state.price.value);
    emit(state.copyWith(
      status: Formz.validate(
          [state.productName, state.id, price, state.hsnCode, state.stock]),
      price: price,
    ));
  }

  FutureOr<void> _onProductNameChanged(
      ProductNameChanged event, Emitter<AddProductFormState> emit) {
    final name = InputString.dirty(event.name);
    emit(state.copyWith(
        status: Formz.validate(
            [name, state.id, state.price, state.hsnCode, state.stock]),
        name: name));
  }

  FutureOr<void> _onProductNameUnfocused(
      ProductNameUnFocused event, Emitter<AddProductFormState> emit) {
    final productName = InputString.dirty(state.productName.value);
    emit(state.copyWith(
        status: Formz.validate(
            [productName, state.id, state.price, state.hsnCode, state.stock]),
        name: productName));
  }

  FutureOr<void> _onOroductCodeUnFocused(
      ProductCodeUnFocused event, Emitter<AddProductFormState> emit) {
    final id = InputIdCode.dirty(state.id.value);
    emit(state.copyWith(
        status: Formz.validate(
            [state.productName, id, state.price, state.hsnCode, state.stock]),
        id: id));
  }

  FutureOr<void> _onProductCodeChanged(
      ProductCodeChanged event, Emitter<AddProductFormState> emit) {
    final id = InputIdCode.dirty(int.tryParse(event.code));
    emit(state.copyWith(
        status: Formz.validate(
            [state.productName, id, state.price, state.hsnCode, state.stock]),
        id: id));
  }

  FutureOr<void> _onStockChanged(
      StockChanged event, Emitter<AddProductFormState> emit) {
    final stock = InputAccounts.dirty(double.tryParse(event.stock));
    emit(state.copyWith(
        status: Formz.validate(
            [state.productName, state.id, state.price, state.hsnCode, stock]),
        stock: stock));
  }

  FutureOr<void> _onStockUnfocused(
      StockUnFocused event, Emitter<AddProductFormState> emit) {
    final stock = InputAccounts.dirty(state.stock.value);
    emit(state.copyWith(
        status: Formz.validate(
            [state.productName, state.id, state.price, state.hsnCode, stock]),
        stock: stock));
  }

  FutureOr<void> _onHsnCodeChanged(
      HsnCodeChanged event, Emitter<AddProductFormState> emit) {
    final hsnCode = InputIdCode.dirty(int.tryParse(event.hsnCode));
    emit(state.copyWith(
        status: Formz.validate(
            [state.productName, state.id, state.price, hsnCode, state.stock]),
        hsnCode: hsnCode));
  }

  FutureOr<void> _onHsnCodeUnfocused(
      HsnCodeUnFocused event, Emitter<AddProductFormState> emit) {
    final hsnCode = InputIdCode.dirty(state.hsnCode.value);
    emit(state.copyWith(
        status: Formz.validate(
            [state.productName, state.id, state.price, hsnCode, state.stock]),
        hsnCode: hsnCode));
  }

  FutureOr<void> _onSubmitted(
      Submitted event, Emitter<AddProductFormState> emit) {}
}
