part of 'theme_bloc.dart';

@freezed
class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.changed() = _ThemeChanged;
  const factory ThemeEvent.started() = _AppStarted;
}
