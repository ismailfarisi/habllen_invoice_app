part of 'customer_bloc.dart';

abstract class CustomerEvent extends Equatable {
  const CustomerEvent();

  @override
  List<Object> get props => [];
}

class Started extends CustomerEvent {}

class Refreshed extends CustomerEvent {}

class DeleteCustomer extends CustomerEvent {
  final Company customer;
  final int customerIndex;

  DeleteCustomer({
    required this.customer,
    required this.customerIndex,
  });
}
