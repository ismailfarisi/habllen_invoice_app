part of 'invoice_detail_bloc.dart';

@freezed
class InvoiceDetailState with _$InvoiceDetailState {
  const factory InvoiceDetailState({
    @Default(const InputInvoice.pure()) InputInvoice inputInvoice,
    @Default(FormzStatus.pure) FormzStatus invoiceStatus,
  }) = _InvoiceDetailState;
  factory InvoiceDetailState.initial(Invoice? invoice) {
    if (invoice != null) {
      final inputInvoice = InputInvoice.dirty(invoice);
      return InvoiceDetailState(
          inputInvoice: inputInvoice,
          invoiceStatus: Formz.validate([inputInvoice]));
    } else
      return InvoiceDetailState();
  }
}
