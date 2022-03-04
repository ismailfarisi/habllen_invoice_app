part of 'basic_info_bloc.dart';

@freezed
class BasicInfoState with _$BasicInfoState {
  const factory BasicInfoState(
      {required DateTime date,
      @Default(7) int dueDatePeriod}) = _BasicInfoState;
  factory BasicInfoState.initial([DateTime? date]) =>
      BasicInfoState(date: date ?? DateTime.now());
}
