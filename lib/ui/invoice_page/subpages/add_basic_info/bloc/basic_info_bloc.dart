import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habllen/ui/invoice_page/invoice_detail_bloc/invoice_detail_bloc.dart';

part 'basic_info_event.dart';
part 'basic_info_state.dart';
part 'basic_info_bloc.freezed.dart';

class BasicInfoBloc extends Bloc<BasicInfoEvent, BasicInfoState> {
  BasicInfoBloc(this.bloc)
      : super(BasicInfoState.initial(bloc.state.inputInvoice.value.date)) {
    on<_DateChanged>(_onDateChanged);
    on<_DueDatePeriodChanged>(_onDueDatePeriodChanged);
    on<_Submitted>(_onSubmitted);
  }
  final InvoiceDetailBloc bloc;

  FutureOr<void> _onDateChanged(
      _DateChanged event, Emitter<BasicInfoState> emit) {
    emit(state.copyWith(date: event.date));
  }

  FutureOr<void> _onDueDatePeriodChanged(
      _DueDatePeriodChanged event, Emitter<BasicInfoState> emit) {
    emit(state.copyWith(dueDatePeriod: event.days));
  }

  FutureOr<void> _onSubmitted(event, Emitter<BasicInfoState> emit) {
    bloc.add(InvoiceDetailEvent.dateChanged(state.date));
  }
}
