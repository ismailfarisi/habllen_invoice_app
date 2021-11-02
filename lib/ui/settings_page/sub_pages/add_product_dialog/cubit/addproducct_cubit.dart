import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habllen/model/product.dart';
import 'package:habllen/repository/repository.dart';

part 'addproducct_state.dart';

class AddproducctCubit extends Cubit<AddproducctState> {
  AddproducctCubit({required this.repository}) : super(AddproducctState());

  final Repository repository;
  addProduct(Product product) async {
    emit(state.copyWith(status: Status.loading));
    try {
      await repository.addProduct(product);
    } catch (e) {}
  }
}
