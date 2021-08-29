import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'new_invoice_event.dart';
part 'new_invoice_state.dart';

class NewInvoiceBloc extends Bloc<NewInvoiceEvent, NewInvoiceState> {
  NewInvoiceBloc() : super(NewInvoiceState.stage1());

  @override
  Stream<NewInvoiceState> mapEventToState(event) async* {
    if (event is ScreenOneFinished) {
      yield NewInvoiceState.stage2();
    } else if (event is ScreenTwoFinished) {
      yield NewInvoiceState.stage3();
    } else {
      yield NewInvoiceState.stage1();
    }
  }
}
