import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/ui/invoice_page/invoice_detail_bloc/invoice_detail_bloc.dart';

part 'add_invoice_customer_page_state.dart';
part 'add_invoice_customer_page_cubit.freezed.dart';

class AddInvoiceCustomerPageCubit extends Cubit<AddInvoiceCustomerPageState> {
  AddInvoiceCustomerPageCubit(
      {required this.invoiceDetailBloc, required this.repository})
      : super(AddInvoiceCustomerPageState());
  final InvoiceDetailBloc invoiceDetailBloc;
  final Repository repository;

  void fethCustomers() async {
    final result = await repository.getCustomers();
    result.when(
        success: (data) {
          emit(state.copyWith(companies: data));
        },
        error: (e) {});
  }

  void customerSelected(Customer customer) {
    invoiceDetailBloc.add(InvoiceDetailEvent.companyAdded(customer));
    emit(state.copyWith(selectedCustomer: customer));
  }
}
