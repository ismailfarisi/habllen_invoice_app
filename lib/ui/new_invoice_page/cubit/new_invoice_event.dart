part of 'new_invoice_Bloc.dart';

abstract class NewInvoiceEvent extends Equatable {}

class FirstStarted extends NewInvoiceEvent {
  @override
  List<Object?> get props => [];
}

class CustomerAdded extends NewInvoiceEvent {
  final Company company;

  CustomerAdded(this.company);
  @override
  List<Object?> get props => [company];
}

class ProductAdded extends NewInvoiceEvent {
  final InvoiceProduct invoiceProduct;

  ProductAdded(this.invoiceProduct);
  @override
  List<Object?> get props => [invoiceProduct];
}

class ScreenThreeFinished extends NewInvoiceEvent {
  @override
  List<Object?> get props => [];
}
