part of 'registerpayment_bloc.dart';

@freezed
class RegisterpaymentEvent with _$RegisterpaymentEvent {
  const factory RegisterpaymentEvent.dateChanged({required DateTime date}) =
      _DateChanged;
  const factory RegisterpaymentEvent.amountChanged({required String amount}) =
      _AmountChanged;
  const factory RegisterpaymentEvent.remarksChanged({String? remarks}) =
      _RemarksChanged;
  const factory RegisterpaymentEvent.submitPressed() = _SubmitPressed;
}
