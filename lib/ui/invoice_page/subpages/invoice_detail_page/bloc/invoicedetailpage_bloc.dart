import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habllen/model/firestore_failure.dart';
import 'package:habllen/model/invoice.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habllen/repository/repository.dart';

part 'invoicedetailpage_bloc.freezed.dart';

part 'invoicedetailpage_state.dart';
part 'invoicedetailpage_event.dart';

class InvoicedetailpageBloc
    extends Bloc<InvoicedetailpageEvent, InvoicedetailpageState> {
  InvoicedetailpageBloc({required this.repository})
      : super(InvoicedetailpageState()) {
    on<EditModeChanged>(_onEditModeChanged);
    on<UpdateInvoice>(_onUpdateInvoice);
  }
  final Repository repository;

  FutureOr<void> _onEditModeChanged(
      EditModeChanged event, Emitter<InvoicedetailpageState> emit) {
    emit(state.copyWith(isEditableMode: event.isEditMode));
  }

  FutureOr<void> _onUpdateInvoice(
      UpdateInvoice event, Emitter<InvoicedetailpageState> emit) async {
    emit(state.copyWith(updateStatus: Status.loading));
    final result = await repository.updateInvoice(event.invoice);

    result.when(success: (void data) {
      emit(state.copyWith(isEditableMode: false, updateStatus: Status.success));
    }, error: (FirestoreFailure e) {
      emit(state.copyWith(updateStatus: Status.error));
    });
  }
}
