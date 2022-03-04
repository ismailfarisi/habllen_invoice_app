import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habllen/model/payment.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/shared/forms_validator/validator.dart';

part 'registerpayment_event.dart';
part 'registerpayment_state.dart';
part 'registerpayment_bloc.freezed.dart';

class RegisterpaymentBloc
    extends Bloc<RegisterpaymentEvent, RegisterpaymentState> {
  RegisterpaymentBloc({required this.repository, required this.companyId})
      : super(RegisterpaymentState.initial()) {
    on<_AmountChanged>(_onAmountChanged);
    on<_DateChanged>(_onDateChanged);
    on<_RemarksChanged>(_onRemarksChanged);
    on<_SubmitPressed>(_onSubmitPressed);
  }
  final String companyId;
  final Repository repository;
  FutureOr<void> _onAmountChanged(
      _AmountChanged event, Emitter<RegisterpaymentState> emit) {
    final amount = InputAccounts.dirty(double.tryParse(event.amount));
    emit(state.copyWith(amount: amount, status: Formz.validate([amount])));
  }

  FutureOr<void> _onDateChanged(
      _DateChanged event, Emitter<RegisterpaymentState> emit) {
    final date = InputDate.dirty(event.date);
    emit(state.copyWith(date: date, status: Formz.validate([date])));
  }

  FutureOr<void> _onRemarksChanged(
      _RemarksChanged event, Emitter<RegisterpaymentState> emit) {
    final remarks = InputString.dirty(event.remarks.toString());
    emit(state.copyWith(remarks: remarks, status: Formz.validate([remarks])));
  }

  FutureOr<void> _onSubmitPressed(
      _SubmitPressed event, Emitter<RegisterpaymentState> emit) async {
    emit(state.copyWith(
        status: Formz.validate([
      state.amount,
      state.date,
    ])));
    if (state.status.isValid) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final Payment payment = Payment(
          companyId: companyId,
          amount: state.amount.value!,
          date: state.date.value,
          remarks: state.remarks.value);
      final result = await repository.recordPayment(payment);
      result.when(success: (data) {
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      }, error: (error) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      });
    }
  }
}
