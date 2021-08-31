import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'new_invoice_event.dart';
part 'new_invoice_state.dart';

class NewInvoiceBloc extends Bloc<NewInvoiceEvent, ScreenStage> {
  NewInvoiceBloc() : super(ScreenStage());

  @override
  Stream<ScreenStage> mapEventToState(event) async* {
    if (event is CustomerAdded) {
      yield state.copywith(2);
    } else if (event is ProductAdded) {
      yield state.copywith(3);
    } else {
      yield state.copywith(1);
    }
  }
}
