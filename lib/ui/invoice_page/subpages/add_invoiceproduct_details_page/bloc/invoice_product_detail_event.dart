part of "invoice_product_detail_bloc.dart";

@freezed
class InvoiceProductDetailEvent with _$InvoiceProductDetailEvent {
  const factory InvoiceProductDetailEvent.loadInvoiceProductDetail(
      {required String invoiceProductId}) = _LoadInvoiceProductDetail;
  const factory InvoiceProductDetailEvent.quantityChanged(String quantity) =
      _QuantityChanged;
  const factory InvoiceProductDetailEvent.priceChanged(String price) =
      _PriceChanged;
  const factory InvoiceProductDetailEvent.saveInvoiceProductDetail() =
      _SaveInvoiceProductDetail;
}
