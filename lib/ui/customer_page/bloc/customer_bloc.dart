import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/model/result.dart';
import 'package:habllen/repository/repository.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  CustomerBloc(this.repository) : super(CustomerInitial()) {
    on<Started>(_onStarted);
    on<DeleteCustomer>(_onDeleteCustomer);
    on<Refreshed>(_onRefreshed);
  }
  final Repository repository;

  FutureOr<void> _onStarted(Started event, Emitter<CustomerState> emit) async {
    if (state.hasReachedMax) return;
    print(state.hasReachedMax);
    try {
      emit(state.copywith(status: Status.loading));
      Result<List<Company>> list = await repository.getCustomers();
      list.when(
        error: (e) => emit(state.copywith(status: Status.filesFetchingFailed)),
        success: (list) => emit(state.copywith(
            customerList: list,
            status: Status.filesFetched,
            hasReachedMax: false)),
      );
    } on Exception {
      emit(state.copywith(status: Status.filesFetchingFailed));
    }
  }

  FutureOr<void> _onDeleteCustomer(
      DeleteCustomer event, Emitter<CustomerState> emit) async {
    try {
      await repository.deleteCustomer(event.customer);
      print("deleted");
      add(Started());
    } catch (e) {
      throw e;
    }
  }

  FutureOr<void> _onRefreshed(Refreshed event, Emitter<CustomerState> emit) {
    try {} catch (e) {}
  }
}
