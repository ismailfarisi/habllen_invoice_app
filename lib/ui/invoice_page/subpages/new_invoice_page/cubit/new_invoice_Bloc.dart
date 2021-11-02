import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/model/invoice_product.dart';
import 'package:habllen/model/product.dart';
import 'package:habllen/repository/repository.dart';

part 'new_invoice_event.dart';
part 'new_invoice_state.dart';

class NewInvoiceBloc extends Bloc<NewInvoiceEvent, ScreenStage> {
  NewInvoiceBloc(this.repository) : super(ScreenStage());

  static const MAX_STEPPER_INDEX = 2;

  final Repository repository;

  @override
  Stream<ScreenStage> mapEventToState(event) async* {
    ;
    List<InvoiceProduct> list;
    if (state.invoiceProductList.isEmpty) {
      list = [];
    }
    if (event is ProductAddedToInvoice) {
      list = List.of(state.invoiceProductList)..add(event.invoiceProduct);

      yield state.copywith(invoiceProductList: list);
    }
    if (event is FetchProducts) {
      final products = await repository.getProducts();
      print(products);
      yield state.copywith(productList: products);
    }
    if (event is FirstStarted) {
      final customers = await repository.getCustomers();
      print(customers);
      yield state.copywith(companylist: customers);
    }
    if (event is OnStepContinue) {
      yield state.copywith(
          currentIndex: (event.step != null)
              ? (event.step! < state.currentIndex)
                  ? event.step
                  : state.currentIndex
              : state.currentIndex + 1);
    }
    if (event is CreateDraftInvoice) {
      final Company? company = state.company;
      final DateTime? date = state.date;
      print("create draft invoice $company $date");
      if (state.invoiceProductList.isNotEmpty &&
          company != null &&
          date != null) {
        final lastInvoiceNo = await repository.getLastInvoiceNo();
        print("last invoice no :$lastInvoiceNo");
        final int invoiceNo = lastInvoiceNo + 1;
        final invoiceProducts = state.invoiceProductList;
        final invoice = Invoice(
            invoiceNo: invoiceNo,
            company: company,
            date: date,
            product: invoiceProducts);
        print(invoice);
        yield state.copywith(invoice: invoice);
      }
    }
    if (event is CompanySelected) {
      yield state.copywith(company: event.company);
    }
    if (event is DateSelected) {
      yield state.copywith(date: event.date);
    }
  }
}
