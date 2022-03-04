part of 'customer_bloc.dart';

abstract class CustomerEvent extends Equatable {
  const CustomerEvent();

  @override
  List<Object> get props => [];
}

class Started extends CustomerEvent {}

class Refreshed extends CustomerEvent {}

class DeleteCustomer extends CustomerEvent {
  final Customer customer;
  final int customerIndex;

  DeleteCustomer({
    required this.customer,
    required this.customerIndex,
  });
}

class LoadMore extends CustomerEvent {}
