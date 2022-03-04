// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'basic_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BasicInfoEventTearOff {
  const _$BasicInfoEventTearOff();

  _InitializeWithData initializeWithData() {
    return const _InitializeWithData();
  }

  _DateChanged dateChanged(DateTime date) {
    return _DateChanged(
      date,
    );
  }

  _DueDatePeriodChanged dueDatePeriodChanged(int days) {
    return _DueDatePeriodChanged(
      days,
    );
  }

  _Submitted submitted() {
    return const _Submitted();
  }
}

/// @nodoc
const $BasicInfoEvent = _$BasicInfoEventTearOff();

/// @nodoc
mixin _$BasicInfoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeWithData,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(int days) dueDatePeriodChanged,
    required TResult Function() submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializeWithData,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(int days)? dueDatePeriodChanged,
    TResult Function()? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeWithData,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(int days)? dueDatePeriodChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeWithData value) initializeWithData,
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_DueDatePeriodChanged value) dueDatePeriodChanged,
    required TResult Function(_Submitted value) submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeWithData value)? initializeWithData,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_DueDatePeriodChanged value)? dueDatePeriodChanged,
    TResult Function(_Submitted value)? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeWithData value)? initializeWithData,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_DueDatePeriodChanged value)? dueDatePeriodChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicInfoEventCopyWith<$Res> {
  factory $BasicInfoEventCopyWith(
          BasicInfoEvent value, $Res Function(BasicInfoEvent) then) =
      _$BasicInfoEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$BasicInfoEventCopyWithImpl<$Res>
    implements $BasicInfoEventCopyWith<$Res> {
  _$BasicInfoEventCopyWithImpl(this._value, this._then);

  final BasicInfoEvent _value;
  // ignore: unused_field
  final $Res Function(BasicInfoEvent) _then;
}

/// @nodoc
abstract class _$InitializeWithDataCopyWith<$Res> {
  factory _$InitializeWithDataCopyWith(
          _InitializeWithData value, $Res Function(_InitializeWithData) then) =
      __$InitializeWithDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitializeWithDataCopyWithImpl<$Res>
    extends _$BasicInfoEventCopyWithImpl<$Res>
    implements _$InitializeWithDataCopyWith<$Res> {
  __$InitializeWithDataCopyWithImpl(
      _InitializeWithData _value, $Res Function(_InitializeWithData) _then)
      : super(_value, (v) => _then(v as _InitializeWithData));

  @override
  _InitializeWithData get _value => super._value as _InitializeWithData;
}

/// @nodoc

class _$_InitializeWithData
    with DiagnosticableTreeMixin
    implements _InitializeWithData {
  const _$_InitializeWithData();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BasicInfoEvent.initializeWithData()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BasicInfoEvent.initializeWithData'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _InitializeWithData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeWithData,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(int days) dueDatePeriodChanged,
    required TResult Function() submitted,
  }) {
    return initializeWithData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializeWithData,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(int days)? dueDatePeriodChanged,
    TResult Function()? submitted,
  }) {
    return initializeWithData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeWithData,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(int days)? dueDatePeriodChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (initializeWithData != null) {
      return initializeWithData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeWithData value) initializeWithData,
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_DueDatePeriodChanged value) dueDatePeriodChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return initializeWithData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeWithData value)? initializeWithData,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_DueDatePeriodChanged value)? dueDatePeriodChanged,
    TResult Function(_Submitted value)? submitted,
  }) {
    return initializeWithData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeWithData value)? initializeWithData,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_DueDatePeriodChanged value)? dueDatePeriodChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (initializeWithData != null) {
      return initializeWithData(this);
    }
    return orElse();
  }
}

abstract class _InitializeWithData implements BasicInfoEvent {
  const factory _InitializeWithData() = _$_InitializeWithData;
}

/// @nodoc
abstract class _$DateChangedCopyWith<$Res> {
  factory _$DateChangedCopyWith(
          _DateChanged value, $Res Function(_DateChanged) then) =
      __$DateChangedCopyWithImpl<$Res>;
  $Res call({DateTime date});
}

/// @nodoc
class __$DateChangedCopyWithImpl<$Res>
    extends _$BasicInfoEventCopyWithImpl<$Res>
    implements _$DateChangedCopyWith<$Res> {
  __$DateChangedCopyWithImpl(
      _DateChanged _value, $Res Function(_DateChanged) _then)
      : super(_value, (v) => _then(v as _DateChanged));

  @override
  _DateChanged get _value => super._value as _DateChanged;

  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(_DateChanged(
      date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_DateChanged with DiagnosticableTreeMixin implements _DateChanged {
  const _$_DateChanged(this.date);

  @override
  final DateTime date;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BasicInfoEvent.dateChanged(date: $date)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BasicInfoEvent.dateChanged'))
      ..add(DiagnosticsProperty('date', date));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DateChanged &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$DateChangedCopyWith<_DateChanged> get copyWith =>
      __$DateChangedCopyWithImpl<_DateChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeWithData,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(int days) dueDatePeriodChanged,
    required TResult Function() submitted,
  }) {
    return dateChanged(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializeWithData,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(int days)? dueDatePeriodChanged,
    TResult Function()? submitted,
  }) {
    return dateChanged?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeWithData,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(int days)? dueDatePeriodChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (dateChanged != null) {
      return dateChanged(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeWithData value) initializeWithData,
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_DueDatePeriodChanged value) dueDatePeriodChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return dateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeWithData value)? initializeWithData,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_DueDatePeriodChanged value)? dueDatePeriodChanged,
    TResult Function(_Submitted value)? submitted,
  }) {
    return dateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeWithData value)? initializeWithData,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_DueDatePeriodChanged value)? dueDatePeriodChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (dateChanged != null) {
      return dateChanged(this);
    }
    return orElse();
  }
}

abstract class _DateChanged implements BasicInfoEvent {
  const factory _DateChanged(DateTime date) = _$_DateChanged;

  DateTime get date;
  @JsonKey(ignore: true)
  _$DateChangedCopyWith<_DateChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DueDatePeriodChangedCopyWith<$Res> {
  factory _$DueDatePeriodChangedCopyWith(_DueDatePeriodChanged value,
          $Res Function(_DueDatePeriodChanged) then) =
      __$DueDatePeriodChangedCopyWithImpl<$Res>;
  $Res call({int days});
}

/// @nodoc
class __$DueDatePeriodChangedCopyWithImpl<$Res>
    extends _$BasicInfoEventCopyWithImpl<$Res>
    implements _$DueDatePeriodChangedCopyWith<$Res> {
  __$DueDatePeriodChangedCopyWithImpl(
      _DueDatePeriodChanged _value, $Res Function(_DueDatePeriodChanged) _then)
      : super(_value, (v) => _then(v as _DueDatePeriodChanged));

  @override
  _DueDatePeriodChanged get _value => super._value as _DueDatePeriodChanged;

  @override
  $Res call({
    Object? days = freezed,
  }) {
    return _then(_DueDatePeriodChanged(
      days == freezed
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DueDatePeriodChanged
    with DiagnosticableTreeMixin
    implements _DueDatePeriodChanged {
  const _$_DueDatePeriodChanged(this.days);

  @override
  final int days;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BasicInfoEvent.dueDatePeriodChanged(days: $days)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BasicInfoEvent.dueDatePeriodChanged'))
      ..add(DiagnosticsProperty('days', days));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DueDatePeriodChanged &&
            const DeepCollectionEquality().equals(other.days, days));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(days));

  @JsonKey(ignore: true)
  @override
  _$DueDatePeriodChangedCopyWith<_DueDatePeriodChanged> get copyWith =>
      __$DueDatePeriodChangedCopyWithImpl<_DueDatePeriodChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeWithData,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(int days) dueDatePeriodChanged,
    required TResult Function() submitted,
  }) {
    return dueDatePeriodChanged(days);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializeWithData,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(int days)? dueDatePeriodChanged,
    TResult Function()? submitted,
  }) {
    return dueDatePeriodChanged?.call(days);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeWithData,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(int days)? dueDatePeriodChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (dueDatePeriodChanged != null) {
      return dueDatePeriodChanged(days);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeWithData value) initializeWithData,
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_DueDatePeriodChanged value) dueDatePeriodChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return dueDatePeriodChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeWithData value)? initializeWithData,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_DueDatePeriodChanged value)? dueDatePeriodChanged,
    TResult Function(_Submitted value)? submitted,
  }) {
    return dueDatePeriodChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeWithData value)? initializeWithData,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_DueDatePeriodChanged value)? dueDatePeriodChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (dueDatePeriodChanged != null) {
      return dueDatePeriodChanged(this);
    }
    return orElse();
  }
}

abstract class _DueDatePeriodChanged implements BasicInfoEvent {
  const factory _DueDatePeriodChanged(int days) = _$_DueDatePeriodChanged;

  int get days;
  @JsonKey(ignore: true)
  _$DueDatePeriodChangedCopyWith<_DueDatePeriodChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SubmittedCopyWith<$Res> {
  factory _$SubmittedCopyWith(
          _Submitted value, $Res Function(_Submitted) then) =
      __$SubmittedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SubmittedCopyWithImpl<$Res> extends _$BasicInfoEventCopyWithImpl<$Res>
    implements _$SubmittedCopyWith<$Res> {
  __$SubmittedCopyWithImpl(_Submitted _value, $Res Function(_Submitted) _then)
      : super(_value, (v) => _then(v as _Submitted));

  @override
  _Submitted get _value => super._value as _Submitted;
}

/// @nodoc

class _$_Submitted with DiagnosticableTreeMixin implements _Submitted {
  const _$_Submitted();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BasicInfoEvent.submitted()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'BasicInfoEvent.submitted'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Submitted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeWithData,
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(int days) dueDatePeriodChanged,
    required TResult Function() submitted,
  }) {
    return submitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializeWithData,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(int days)? dueDatePeriodChanged,
    TResult Function()? submitted,
  }) {
    return submitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeWithData,
    TResult Function(DateTime date)? dateChanged,
    TResult Function(int days)? dueDatePeriodChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeWithData value) initializeWithData,
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_DueDatePeriodChanged value) dueDatePeriodChanged,
    required TResult Function(_Submitted value) submitted,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeWithData value)? initializeWithData,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_DueDatePeriodChanged value)? dueDatePeriodChanged,
    TResult Function(_Submitted value)? submitted,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeWithData value)? initializeWithData,
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_DueDatePeriodChanged value)? dueDatePeriodChanged,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class _Submitted implements BasicInfoEvent {
  const factory _Submitted() = _$_Submitted;
}

/// @nodoc
class _$BasicInfoStateTearOff {
  const _$BasicInfoStateTearOff();

  _BasicInfoState call({required DateTime date, int dueDatePeriod = 7}) {
    return _BasicInfoState(
      date: date,
      dueDatePeriod: dueDatePeriod,
    );
  }
}

/// @nodoc
const $BasicInfoState = _$BasicInfoStateTearOff();

/// @nodoc
mixin _$BasicInfoState {
  DateTime get date => throw _privateConstructorUsedError;
  int get dueDatePeriod => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BasicInfoStateCopyWith<BasicInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicInfoStateCopyWith<$Res> {
  factory $BasicInfoStateCopyWith(
          BasicInfoState value, $Res Function(BasicInfoState) then) =
      _$BasicInfoStateCopyWithImpl<$Res>;
  $Res call({DateTime date, int dueDatePeriod});
}

/// @nodoc
class _$BasicInfoStateCopyWithImpl<$Res>
    implements $BasicInfoStateCopyWith<$Res> {
  _$BasicInfoStateCopyWithImpl(this._value, this._then);

  final BasicInfoState _value;
  // ignore: unused_field
  final $Res Function(BasicInfoState) _then;

  @override
  $Res call({
    Object? date = freezed,
    Object? dueDatePeriod = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dueDatePeriod: dueDatePeriod == freezed
          ? _value.dueDatePeriod
          : dueDatePeriod // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$BasicInfoStateCopyWith<$Res>
    implements $BasicInfoStateCopyWith<$Res> {
  factory _$BasicInfoStateCopyWith(
          _BasicInfoState value, $Res Function(_BasicInfoState) then) =
      __$BasicInfoStateCopyWithImpl<$Res>;
  @override
  $Res call({DateTime date, int dueDatePeriod});
}

/// @nodoc
class __$BasicInfoStateCopyWithImpl<$Res>
    extends _$BasicInfoStateCopyWithImpl<$Res>
    implements _$BasicInfoStateCopyWith<$Res> {
  __$BasicInfoStateCopyWithImpl(
      _BasicInfoState _value, $Res Function(_BasicInfoState) _then)
      : super(_value, (v) => _then(v as _BasicInfoState));

  @override
  _BasicInfoState get _value => super._value as _BasicInfoState;

  @override
  $Res call({
    Object? date = freezed,
    Object? dueDatePeriod = freezed,
  }) {
    return _then(_BasicInfoState(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dueDatePeriod: dueDatePeriod == freezed
          ? _value.dueDatePeriod
          : dueDatePeriod // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_BasicInfoState
    with DiagnosticableTreeMixin
    implements _BasicInfoState {
  const _$_BasicInfoState({required this.date, this.dueDatePeriod = 7});

  @override
  final DateTime date;
  @JsonKey()
  @override
  final int dueDatePeriod;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BasicInfoState(date: $date, dueDatePeriod: $dueDatePeriod)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BasicInfoState'))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('dueDatePeriod', dueDatePeriod));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BasicInfoState &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality()
                .equals(other.dueDatePeriod, dueDatePeriod));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(dueDatePeriod));

  @JsonKey(ignore: true)
  @override
  _$BasicInfoStateCopyWith<_BasicInfoState> get copyWith =>
      __$BasicInfoStateCopyWithImpl<_BasicInfoState>(this, _$identity);
}

abstract class _BasicInfoState implements BasicInfoState {
  const factory _BasicInfoState({required DateTime date, int dueDatePeriod}) =
      _$_BasicInfoState;

  @override
  DateTime get date;
  @override
  int get dueDatePeriod;
  @override
  @JsonKey(ignore: true)
  _$BasicInfoStateCopyWith<_BasicInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}
