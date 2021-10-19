import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:googleapis/admin/directory_v1.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/repository/remote/firestore.dart';

part 'customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit() : super(CustomerState.initial());
  final FirebaseRepository _firebaseRepository = FirebaseRepository();
  late final Company customer;
  String? name;
  String? addressOne;
  String? addressTwo;
  String? gst;

  void addCustomer() async {
    print(name);
    emit(CustomerState.loading());
    try {
      customer = Company(
          name: name!,
          addressOne: addressOne!,
          gst: gst!,
          addressTwo: addressTwo);
      print(customer);
      await _firebaseRepository.addCustomer(customer);
      emit(CustomerState.success());
    } catch (e) {
      emit(CustomerState.failure());
    }
  }
}
