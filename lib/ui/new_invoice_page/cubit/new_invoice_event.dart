part of 'new_invoice_Bloc.dart';

abstract class NewInvoiceEvent extends Equatable {}

class CustomerAdded extends NewInvoiceEvent {
  @override
  List<Object?> get props => [];
}

class ProductAdded extends NewInvoiceEvent {
  @override
  List<Object?> get props => [];
}

class ScreenThreeFinished extends NewInvoiceEvent {
  @override
  List<Object?> get props => [];
}
