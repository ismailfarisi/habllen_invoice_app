part of 'registerpayment_bloc.dart';

@freezed
class RegisterpaymentState with _$RegisterpaymentState {
  const factory RegisterpaymentState({
    @Default(InputAccounts.pure()) InputAccounts amount,
    required InputDate date,
    @Default(InputString.pure()) InputString remarks,
    @Default(FormzStatus.pure) FormzStatus status,
  }) = _RegisterpaymentState;
  factory RegisterpaymentState.initial() => RegisterpaymentState(
        amount: InputAccounts.pure(),
        date: InputDate.dirty(DateTime.now()),
        remarks: InputString.pure(),
      );
}
