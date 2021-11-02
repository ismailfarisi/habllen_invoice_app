import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habllen/model/product.dart';
import 'package:habllen/repository/remote/firestore.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/repository/repositoryimpl.dart';

part 'productspage_state.dart';

class ProductspageCubit extends Cubit<ProductspageState> {
  ProductspageCubit() : super(ProductspageState());

  final Repository repository =
      RepositoryImpl(firebaseRepository: FirebaseRepository());

  getProducts() async {
    final products = await repository.getProducts();
    emit(state.copyWith(productList: products));
  }
}
