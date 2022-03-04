import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:habllen/model/product.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/shared/forms_validator/validator.dart';
import 'package:habllen/ui/products_page/bloc/productspage_bloc.dart';

part 'addproductform_state.dart';
part 'addproductform_event.dart';

class AddProductFormBloc
    extends Bloc<AddProductFormEvent, AddProductFormState> {
  AddProductFormBloc(
      {required ProductspageBloc? productspageBloc,
      required Repository repository,
      Product? product})
      : _productspageBloc = productspageBloc,
        _repository = repository,
        _product = product,
        super(AddProductFormState.initial(product)) {
    on<PriceChanged>(_onPriceChanged);

    on<ProductNameChanged>(_onProductNameChanged);

    on<ProductCodeChanged>(_onProductCodeChanged);

    on<StockChanged>(_onStockChanged);

    on<HsnCodeChanged>(_onHsnCodeChanged);

    on<GstPercentageChanged>(_onGstPercentageChanged);
    on<Submitted>(_onSubmitted);
  }

  final Repository _repository;
  final ProductspageBloc? _productspageBloc;
  final Product? _product;

  FutureOr<void> _onPriceChanged(
      PriceChanged event, Emitter<AddProductFormState> emit) {
    try {
      final price = InputAccounts.dirty(double.tryParse(event.price));
      emit(state.copyWith(
          status: Formz.validate([
            state.productName,
            state.id,
            price,
            state.hsnCode,
            state.stock,
            state.gstPercentage
          ]),
          price: price));
    } catch (e) {}
  }

  FutureOr<void> _onProductNameChanged(
      ProductNameChanged event, Emitter<AddProductFormState> emit) {
    final name = InputString.dirty(event.name);
    emit(state.copyWith(
        status: Formz.validate([
          name,
          state.id,
          state.price,
          state.hsnCode,
          state.stock,
          state.gstPercentage
        ]),
        name: name));
  }

  FutureOr<void> _onProductCodeChanged(
      ProductCodeChanged event, Emitter<AddProductFormState> emit) {
    final id = InputIdCode.dirty(int.tryParse(event.code));
    emit(state.copyWith(
        status: Formz.validate([
          state.productName,
          id,
          state.price,
          state.hsnCode,
          state.stock,
          state.gstPercentage
        ]),
        id: id));
  }

  FutureOr<void> _onStockChanged(
      StockChanged event, Emitter<AddProductFormState> emit) {
    final stock = InputAccounts.dirty(double.tryParse(event.stock));
    emit(state.copyWith(
        status: Formz.validate([
          state.productName,
          state.id,
          state.price,
          state.hsnCode,
          stock,
          state.gstPercentage
        ]),
        stock: stock));
  }

  FutureOr<void> _onHsnCodeChanged(
      HsnCodeChanged event, Emitter<AddProductFormState> emit) {
    final hsnCode = InputString.dirty(event.hsnCode);
    emit(state.copyWith(
        status: Formz.validate([
          state.productName,
          state.id,
          state.price,
          hsnCode,
          state.stock,
          state.gstPercentage
        ]),
        hsnCode: hsnCode));
  }

  FutureOr<void> _onSubmitted(
      Submitted event, Emitter<AddProductFormState> emit) async {
    if (state.status.isValid) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final Product product = Product(
          code: state.id.value!,
          gstPercentage: state.gstPercentage.value!,
          name: state.productName.value!,
          price: state.price.value!,
          hsnCode: state.hsnCode.value!,
          currentStock: state.stock.value ?? 0);
      try {
        if (_product != null) {
          final uproduct = product.copyWith(id: _product!.id);
          await _repository.updateProduct(uproduct);
        } else {
          await _repository.addProduct(product);
        }
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
        if (_productspageBloc != null) _productspageBloc!.add(FetchProducts());
      } catch (e) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
        print(e);
      }
    }
  }

  FutureOr<void> _onGstPercentageChanged(
      GstPercentageChanged event, Emitter<AddProductFormState> emit) {
    final gstPercentage =
        InputAccounts.dirty(double.tryParse(event.gstPercentage));
    emit(state.copyWith(
        status: Formz.validate([
          state.productName,
          state.id,
          state.price,
          state.hsnCode,
          state.stock,
          gstPercentage
        ]),
        gstPercentage: gstPercentage));
  }
}
