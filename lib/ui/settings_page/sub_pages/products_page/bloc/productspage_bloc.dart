import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habllen/model/product.dart';
import 'package:habllen/repository/repository.dart';

part 'productspage_state.dart';
part 'productspage_event.dart';

class ProductspageBloc extends Bloc<ProductsPageEvent, ProductspageState> {
  ProductspageBloc({required this.repository}) : super(ProductspageState()) {
    on<FetchProducts>(_onFetchProducts);
    on<DeleteProduct>(_onDeleteProduct);
  }

  final Repository repository;

  FutureOr<void> _onFetchProducts(
      FetchProducts event, Emitter<ProductspageState> emit) async {
    try {
      final result = await repository.getProducts();
      result.when(
        success: (data) => emit(state.copyWith(
            productList: data, fetchProductStatus: Status.success)),
        error: (e) => emit(state.copyWith(fetchProductStatus: Status.failed)),
      );
    } on Exception {}
  }

  FutureOr<void> _onDeleteProduct(
      DeleteProduct event, Emitter<ProductspageState> emit) async {
    final result = await repository.deleteProduct(event.product);
  }
}
