import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/model/invoice_product.dart';
import 'package:habllen/repository/repository.dart';

part 'new_invoice_event.dart';
part 'new_invoice_state.dart';

class NewInvoiceBloc extends Bloc<NewInvoiceEvent, ScreenStage> {
  NewInvoiceBloc(this.repository) : super(ScreenStage());

  late Company company;
  late Invoice invoice;
  late InvoiceProduct invoiceProducts;
  final Repository repository;

  @override
  Stream<ScreenStage> mapEventToState(event) async* {
    if (event is CustomerAdded) {
      yield state.copywith(currentIndex: state.currentIndex + 1);
    }
    if (event is ProductAdded) {
      yield state.copywith(currentIndex: state.currentIndex + 1);
    }
    if (event is FirstStarted) {
      final customers = await repository.getCustomers();
      print(customers);
      yield state.copywith(companylist: customers);
    }
  }
}
