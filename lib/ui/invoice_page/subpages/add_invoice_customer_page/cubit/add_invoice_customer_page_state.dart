part of 'add_invoice_customer_page_cubit.dart';

@freezed
class AddInvoiceCustomerPageState with _$AddInvoiceCustomerPageState {
  const factory AddInvoiceCustomerPageState({
    @Default(const []) List<Customer> companies,
    Customer? selectedCustomer,
  }) = _AddInvoiceCustomerPageState;
}
