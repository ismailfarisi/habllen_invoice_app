part of 'invoice_detail_bloc.dart';

@freezed
class InvoiceDetailEvent with _$InvoiceDetailEvent {
  const factory InvoiceDetailEvent.dateChanged(DateTime date) = _DateChanged;
  const factory InvoiceDetailEvent.newProductAdded(InvoiceProduct product) =
      _NewProductAdded;
  const factory InvoiceDetailEvent.productDeleted(InvoiceProduct product) =
      _ProductDeleted;
  const factory InvoiceDetailEvent.productEdited(InvoiceProduct product) =
      _ProductEdited;
  const factory InvoiceDetailEvent.companyAdded(Customer company) =
      _CompanyAdded;
}
