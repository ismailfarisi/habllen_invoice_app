part of 'invoicedetailpage_bloc.dart';

class InvoicedetailpageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class EditModeChanged extends InvoicedetailpageEvent {
  final bool isEditMode;

  EditModeChanged({required this.isEditMode});
}

class UpdateInvoice extends InvoicedetailpageEvent {
  final Invoice invoice;

  UpdateInvoice({required this.invoice});
}
