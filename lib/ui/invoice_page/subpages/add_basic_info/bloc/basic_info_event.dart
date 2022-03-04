part of 'basic_info_bloc.dart';

@freezed
class BasicInfoEvent with _$BasicInfoEvent {
  const factory BasicInfoEvent.initializeWithData() = _InitializeWithData;
  const factory BasicInfoEvent.dateChanged(DateTime date) = _DateChanged;
  const factory BasicInfoEvent.dueDatePeriodChanged(int days) =
      _DueDatePeriodChanged;
  const factory BasicInfoEvent.submitted() = _Submitted;
}
