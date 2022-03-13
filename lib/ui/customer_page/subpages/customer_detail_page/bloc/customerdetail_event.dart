part of 'customerdetail_bloc.dart';

@freezed
class CustomerDetailEvent with _$CustomerDetailEvent {
  const factory CustomerDetailEvent.started() = _Started;
  const factory CustomerDetailEvent.fetchInvoiceList() = _FetchInvoiceList;
  const factory CustomerDetailEvent.fetchPaymentList() = _FetchPaymentList;
  const factory CustomerDetailEvent.tabChanged(int index) = _TabChanged;
  const factory CustomerDetailEvent.filterModeChanged(FilterMode mode,
      {DateTimeRange? dateRange}) = _FilterModeChanged;
  const factory CustomerDetailEvent.dateRangeChanged(
      DateTimeRange dateTimeRange) = _DateRangeChanged;
}
