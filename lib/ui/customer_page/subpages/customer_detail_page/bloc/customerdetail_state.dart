part of 'customerdetail_bloc.dart';

enum Status { initial, loading, success, failed }
enum FilterMode { lastMonth, lastThreeMonths, lastYear, custom }

@freezed
class CustomerDetailState with _$CustomerDetailState {
  const factory CustomerDetailState({
    String? companyId,
    @Default(const []) List<Invoice> invoiceList,
    @Default(const []) List<Payment> paymentList,
    @Default(Status.initial) Status invoiceListFetchStatus,
    @Default(Status.initial) Status paymentListFetchStatus,
    required DateTimeRange dateRange,
    @Default(0) int tab,
    @Default(0.0) double totalInvoiceAmount,
    @Default(0.0) double totalPaymentReceived,
    required FilterMode filterMode,
  }) = _CustomerDetailState;
  factory CustomerDetailState.initial(Customer company) => _CustomerDetailState(
      companyId: company.id,
      filterMode: FilterMode.lastMonth,
      dateRange: DateTimeRange(
        start: DateTime.now().subtract(Duration(days: 30)),
        end: DateTime.now(),
      ),
      totalInvoiceAmount: company.totalInvoicesAmount ?? 0,
      totalPaymentReceived: company.totalPaymentsReceived ?? 0);
}
