import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/repository/remote/firestore.dart';

part 'customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit() : super(CustomerState.initial());
  final FirebaseRepository _firebaseRepository = FirebaseRepository();

  void addCustomer(Company customer) async {
    emit(CustomerState.loading());
    try {
      await _firebaseRepository.addCustomer(customer);
      emit(CustomerState.success());
    } catch (e) {
      emit(CustomerState.failure());
    }
  }
}
