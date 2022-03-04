part of 'new_invoice_Bloc.dart';

class NewInvoiceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateInvoice extends NewInvoiceEvent {
  final Invoice invoice;
  CreateInvoice(this.invoice);
  @override
  List<Object?> get props => [invoice];
}
