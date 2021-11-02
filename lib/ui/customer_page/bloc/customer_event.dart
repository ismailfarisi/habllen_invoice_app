part of 'customer_bloc.dart';

abstract class CustomerEvent extends Equatable {
  const CustomerEvent();

  @override
  List<Object> get props => [];
}

class WidgetInitiated extends CustomerEvent {}

class Refreshed extends CustomerEvent {}
