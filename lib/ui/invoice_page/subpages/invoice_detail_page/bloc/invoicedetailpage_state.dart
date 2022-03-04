part of 'invoicedetailpage_bloc.dart';

enum Status { initial, loading, success, error }

@freezed
class InvoicedetailpageState with _$InvoicedetailpageState {
  const factory InvoicedetailpageState(
      {@Default(Status.initial) Status updateStatus,
      @Default(false) bool isEditableMode}) = _InvoicedetailpageState;
}
