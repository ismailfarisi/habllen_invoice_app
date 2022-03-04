import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/repository/repository.dart';

part 'new_invoice_event.dart';
part 'new_invoice_state.dart';

class NewInvoiceBloc extends Bloc<NewInvoiceEvent, NewInvoiceState> {
  NewInvoiceBloc(this.repository) : super(NewInvoiceState()) {
    on<CreateInvoice>(_createInvoice);
  }

  final Repository repository;

  FutureOr<void> _createInvoice(
      CreateInvoice event, Emitter<NewInvoiceState> emit) async {
    emit(state.copywith(createInvoiceStatus: Status.loading));
    final result = await repository.createInvoice(event.invoice);
    result.when(success: (data) {
      emit(state.copywith(createInvoiceStatus: Status.success));
    }, error: (error) {
      emit(state.copywith(
        createInvoiceStatus: Status.failure,
      ));
    });
  }
}
