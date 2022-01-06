part of 'new_invoice_Bloc.dart';

class NewInvoiceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

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

class FetchCompanies extends NewInvoiceEvent {
  @override
  List<Object?> get props => [];
}

class CompanyEditorUnFocused extends NewInvoiceEvent {}

class CreateDraftInvoice extends NewInvoiceEvent {
  @override
  List<Object?> get props => [];
}
