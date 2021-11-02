part of 'new_invoice_Bloc.dart';

abstract class NewInvoiceEvent extends Equatable {}

class OnStepContinue extends NewInvoiceEvent {
  final int? step;

  OnStepContinue({this.step});
  @override
  List<Object?> get props => [step];
}

class ProductAddedToInvoice extends NewInvoiceEvent {
  final InvoiceProduct invoiceProduct;

  ProductAddedToInvoice({required this.invoiceProduct});

  @override
  List<Object?> get props => [invoiceProduct];
}

class CompanySelected extends NewInvoiceEvent {
  final Company company;

  CompanySelected({required this.company});
  @override
  List<Object?> get props => [company];
}

class DateSelected extends NewInvoiceEvent {
  final DateTime date;

  DateSelected({required this.date});

  @override
  List<Object?> get props => [date];
}

class FetchProducts extends NewInvoiceEvent {
  @override
  List<Object?> get props => [];
}

class FirstStarted extends NewInvoiceEvent {
  @override
  List<Object?> get props => [];
}

class CreateDraftInvoice extends NewInvoiceEvent {
  @override
  List<Object?> get props => [];
}
