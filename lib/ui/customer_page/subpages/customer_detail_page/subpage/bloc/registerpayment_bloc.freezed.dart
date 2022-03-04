// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'registerpayment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RegisterpaymentEventTearOff {
  const _$RegisterpaymentEventTearOff();

  _DateChanged dateChanged({required DateTime date}) {
    return _DateChanged(
      date: date,
    );
  }

  _AmountChanged amountChanged({required String amount}) {
    return _AmountChanged(
      amount: amount,
    );
  }

  _RemarksChanged remarksChanged({String? remarks}) {
    return _RemarksChanged(
      remarks: remarks,
    );
  }

  _SubmitPressed submitPressed() {
    return const _SubmitPressed();
  }
}

/// @nodoc
const $RegisterpaymentEvent = _$RegisterpaymentEventTearOff();

/// @nodoc
mixin _$RegisterpaymentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String amount) amountChanged,
    required TResult Function(String? remarks) remarksChanged,
    required TResult Function() submitPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String amount)? amountChanged,
    TResult Function(String? remarks)? remarksChanged,
    TResult Function()? submitPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String amount)? amountChanged,
    TResult Function(String? remarks)? remarksChanged,
    TResult Function()? submitPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_AmountChanged value) amountChanged,
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_SubmitPressed value) submitPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_SubmitPressed value)? submitPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_SubmitPressed value)? submitPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterpaymentEventCopyWith<$Res> {
  factory $RegisterpaymentEventCopyWith(RegisterpaymentEvent value,
          $Res Function(RegisterpaymentEvent) then) =
      _$RegisterpaymentEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegisterpaymentEventCopyWithImpl<$Res>
    implements $RegisterpaymentEventCopyWith<$Res> {
  _$RegisterpaymentEventCopyWithImpl(this._value, this._then);

  final RegisterpaymentEvent _value;
  // ignore: unused_field
  final $Res Function(RegisterpaymentEvent) _then;
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
    extends _$RegisterpaymentEventCopyWithImpl<$Res>
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
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_DateChanged implements _DateChanged {
  const _$_DateChanged({required this.date});

  @override
  final DateTime date;

  @override
  String toString() {
    return 'RegisterpaymentEvent.dateChanged(date: $date)';
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
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String amount) amountChanged,
    required TResult Function(String? remarks) remarksChanged,
    required TResult Function() submitPressed,
  }) {
    return dateChanged(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String amount)? amountChanged,
    TResult Function(String? remarks)? remarksChanged,
    TResult Function()? submitPressed,
  }) {
    return dateChanged?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String amount)? amountChanged,
    TResult Function(String? remarks)? remarksChanged,
    TResult Function()? submitPressed,
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
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_AmountChanged value) amountChanged,
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_SubmitPressed value) submitPressed,
  }) {
    return dateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_SubmitPressed value)? submitPressed,
  }) {
    return dateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_SubmitPressed value)? submitPressed,
    required TResult orElse(),
  }) {
    if (dateChanged != null) {
      return dateChanged(this);
    }
    return orElse();
  }
}

abstract class _DateChanged implements RegisterpaymentEvent {
  const factory _DateChanged({required DateTime date}) = _$_DateChanged;

  DateTime get date;
  @JsonKey(ignore: true)
  _$DateChangedCopyWith<_DateChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AmountChangedCopyWith<$Res> {
  factory _$AmountChangedCopyWith(
          _AmountChanged value, $Res Function(_AmountChanged) then) =
      __$AmountChangedCopyWithImpl<$Res>;
  $Res call({String amount});
}

/// @nodoc
class __$AmountChangedCopyWithImpl<$Res>
    extends _$RegisterpaymentEventCopyWithImpl<$Res>
    implements _$AmountChangedCopyWith<$Res> {
  __$AmountChangedCopyWithImpl(
      _AmountChanged _value, $Res Function(_AmountChanged) _then)
      : super(_value, (v) => _then(v as _AmountChanged));

  @override
  _AmountChanged get _value => super._value as _AmountChanged;

  @override
  $Res call({
    Object? amount = freezed,
  }) {
    return _then(_AmountChanged(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AmountChanged implements _AmountChanged {
  const _$_AmountChanged({required this.amount});

  @override
  final String amount;

  @override
  String toString() {
    return 'RegisterpaymentEvent.amountChanged(amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AmountChanged &&
            const DeepCollectionEquality().equals(other.amount, amount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(amount));

  @JsonKey(ignore: true)
  @override
  _$AmountChangedCopyWith<_AmountChanged> get copyWith =>
      __$AmountChangedCopyWithImpl<_AmountChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String amount) amountChanged,
    required TResult Function(String? remarks) remarksChanged,
    required TResult Function() submitPressed,
  }) {
    return amountChanged(amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String amount)? amountChanged,
    TResult Function(String? remarks)? remarksChanged,
    TResult Function()? submitPressed,
  }) {
    return amountChanged?.call(amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String amount)? amountChanged,
    TResult Function(String? remarks)? remarksChanged,
    TResult Function()? submitPressed,
    required TResult orElse(),
  }) {
    if (amountChanged != null) {
      return amountChanged(amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_AmountChanged value) amountChanged,
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_SubmitPressed value) submitPressed,
  }) {
    return amountChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_SubmitPressed value)? submitPressed,
  }) {
    return amountChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_SubmitPressed value)? submitPressed,
    required TResult orElse(),
  }) {
    if (amountChanged != null) {
      return amountChanged(this);
    }
    return orElse();
  }
}

abstract class _AmountChanged implements RegisterpaymentEvent {
  const factory _AmountChanged({required String amount}) = _$_AmountChanged;

  String get amount;
  @JsonKey(ignore: true)
  _$AmountChangedCopyWith<_AmountChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RemarksChangedCopyWith<$Res> {
  factory _$RemarksChangedCopyWith(
          _RemarksChanged value, $Res Function(_RemarksChanged) then) =
      __$RemarksChangedCopyWithImpl<$Res>;
  $Res call({String? remarks});
}

/// @nodoc
class __$RemarksChangedCopyWithImpl<$Res>
    extends _$RegisterpaymentEventCopyWithImpl<$Res>
    implements _$RemarksChangedCopyWith<$Res> {
  __$RemarksChangedCopyWithImpl(
      _RemarksChanged _value, $Res Function(_RemarksChanged) _then)
      : super(_value, (v) => _then(v as _RemarksChanged));

  @override
  _RemarksChanged get _value => super._value as _RemarksChanged;

  @override
  $Res call({
    Object? remarks = freezed,
  }) {
    return _then(_RemarksChanged(
      remarks: remarks == freezed
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_RemarksChanged implements _RemarksChanged {
  const _$_RemarksChanged({this.remarks});

  @override
  final String? remarks;

  @override
  String toString() {
    return 'RegisterpaymentEvent.remarksChanged(remarks: $remarks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RemarksChanged &&
            const DeepCollectionEquality().equals(other.remarks, remarks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(remarks));

  @JsonKey(ignore: true)
  @override
  _$RemarksChangedCopyWith<_RemarksChanged> get copyWith =>
      __$RemarksChangedCopyWithImpl<_RemarksChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String amount) amountChanged,
    required TResult Function(String? remarks) remarksChanged,
    required TResult Function() submitPressed,
  }) {
    return remarksChanged(remarks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String amount)? amountChanged,
    TResult Function(String? remarks)? remarksChanged,
    TResult Function()? submitPressed,
  }) {
    return remarksChanged?.call(remarks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String amount)? amountChanged,
    TResult Function(String? remarks)? remarksChanged,
    TResult Function()? submitPressed,
    required TResult orElse(),
  }) {
    if (remarksChanged != null) {
      return remarksChanged(remarks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_AmountChanged value) amountChanged,
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_SubmitPressed value) submitPressed,
  }) {
    return remarksChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_SubmitPressed value)? submitPressed,
  }) {
    return remarksChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_SubmitPressed value)? submitPressed,
    required TResult orElse(),
  }) {
    if (remarksChanged != null) {
      return remarksChanged(this);
    }
    return orElse();
  }
}

abstract class _RemarksChanged implements RegisterpaymentEvent {
  const factory _RemarksChanged({String? remarks}) = _$_RemarksChanged;

  String? get remarks;
  @JsonKey(ignore: true)
  _$RemarksChangedCopyWith<_RemarksChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SubmitPressedCopyWith<$Res> {
  factory _$SubmitPressedCopyWith(
          _SubmitPressed value, $Res Function(_SubmitPressed) then) =
      __$SubmitPressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SubmitPressedCopyWithImpl<$Res>
    extends _$RegisterpaymentEventCopyWithImpl<$Res>
    implements _$SubmitPressedCopyWith<$Res> {
  __$SubmitPressedCopyWithImpl(
      _SubmitPressed _value, $Res Function(_SubmitPressed) _then)
      : super(_value, (v) => _then(v as _SubmitPressed));

  @override
  _SubmitPressed get _value => super._value as _SubmitPressed;
}

/// @nodoc

class _$_SubmitPressed implements _SubmitPressed {
  const _$_SubmitPressed();

  @override
  String toString() {
    return 'RegisterpaymentEvent.submitPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SubmitPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(String amount) amountChanged,
    required TResult Function(String? remarks) remarksChanged,
    required TResult Function() submitPressed,
  }) {
    return submitPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String amount)? amountChanged,
    TResult Function(String? remarks)? remarksChanged,
    TResult Function()? submitPressed,
  }) {
    return submitPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? dateChanged,
    TResult Function(String amount)? amountChanged,
    TResult Function(String? remarks)? remarksChanged,
    TResult Function()? submitPressed,
    required TResult orElse(),
  }) {
    if (submitPressed != null) {
      return submitPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_AmountChanged value) amountChanged,
    required TResult Function(_RemarksChanged value) remarksChanged,
    required TResult Function(_SubmitPressed value) submitPressed,
  }) {
    return submitPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_SubmitPressed value)? submitPressed,
  }) {
    return submitPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_AmountChanged value)? amountChanged,
    TResult Function(_RemarksChanged value)? remarksChanged,
    TResult Function(_SubmitPressed value)? submitPressed,
    required TResult orElse(),
  }) {
    if (submitPressed != null) {
      return submitPressed(this);
    }
    return orElse();
  }
}

abstract class _SubmitPressed implements RegisterpaymentEvent {
  const factory _SubmitPressed() = _$_SubmitPressed;
}

/// @nodoc
class _$RegisterpaymentStateTearOff {
  const _$RegisterpaymentStateTearOff();

  _RegisterpaymentState call(
      {InputAccounts amount = const InputAccounts.pure(),
      required InputDate date,
      InputString remarks = const InputString.pure(),
      FormzStatus status = FormzStatus.pure}) {
    return _RegisterpaymentState(
      amount: amount,
      date: date,
      remarks: remarks,
      status: status,
    );
  }
}

/// @nodoc
const $RegisterpaymentState = _$RegisterpaymentStateTearOff();

/// @nodoc
mixin _$RegisterpaymentState {
  InputAccounts get amount => throw _privateConstructorUsedError;
  InputDate get date => throw _privateConstructorUsedError;
  InputString get remarks => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterpaymentStateCopyWith<RegisterpaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterpaymentStateCopyWith<$Res> {
  factory $RegisterpaymentStateCopyWith(RegisterpaymentState value,
          $Res Function(RegisterpaymentState) then) =
      _$RegisterpaymentStateCopyWithImpl<$Res>;
  $Res call(
      {InputAccounts amount,
      InputDate date,
      InputString remarks,
      FormzStatus status});
}

/// @nodoc
class _$RegisterpaymentStateCopyWithImpl<$Res>
    implements $RegisterpaymentStateCopyWith<$Res> {
  _$RegisterpaymentStateCopyWithImpl(this._value, this._then);

  final RegisterpaymentState _value;
  // ignore: unused_field
  final $Res Function(RegisterpaymentState) _then;

  @override
  $Res call({
    Object? amount = freezed,
    Object? date = freezed,
    Object? remarks = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as InputAccounts,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as InputDate,
      remarks: remarks == freezed
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as InputString,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc
abstract class _$RegisterpaymentStateCopyWith<$Res>
    implements $RegisterpaymentStateCopyWith<$Res> {
  factory _$RegisterpaymentStateCopyWith(_RegisterpaymentState value,
          $Res Function(_RegisterpaymentState) then) =
      __$RegisterpaymentStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {InputAccounts amount,
      InputDate date,
      InputString remarks,
      FormzStatus status});
}

/// @nodoc
class __$RegisterpaymentStateCopyWithImpl<$Res>
    extends _$RegisterpaymentStateCopyWithImpl<$Res>
    implements _$RegisterpaymentStateCopyWith<$Res> {
  __$RegisterpaymentStateCopyWithImpl(
      _RegisterpaymentState _value, $Res Function(_RegisterpaymentState) _then)
      : super(_value, (v) => _then(v as _RegisterpaymentState));

  @override
  _RegisterpaymentState get _value => super._value as _RegisterpaymentState;

  @override
  $Res call({
    Object? amount = freezed,
    Object? date = freezed,
    Object? remarks = freezed,
    Object? status = freezed,
  }) {
    return _then(_RegisterpaymentState(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as InputAccounts,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as InputDate,
      remarks: remarks == freezed
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as InputString,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_RegisterpaymentState implements _RegisterpaymentState {
  const _$_RegisterpaymentState(
      {this.amount = const InputAccounts.pure(),
      required this.date,
      this.remarks = const InputString.pure(),
      this.status = FormzStatus.pure});

  @JsonKey()
  @override
  final InputAccounts amount;
  @override
  final InputDate date;
  @JsonKey()
  @override
  final InputString remarks;
  @JsonKey()
  @override
  final FormzStatus status;

  @override
  String toString() {
    return 'RegisterpaymentState(amount: $amount, date: $date, remarks: $remarks, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterpaymentState &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.remarks, remarks) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(remarks),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$RegisterpaymentStateCopyWith<_RegisterpaymentState> get copyWith =>
      __$RegisterpaymentStateCopyWithImpl<_RegisterpaymentState>(
          this, _$identity);
}

abstract class _RegisterpaymentState implements RegisterpaymentState {
  const factory _RegisterpaymentState(
      {InputAccounts amount,
      required InputDate date,
      InputString remarks,
      FormzStatus status}) = _$_RegisterpaymentState;

  @override
  InputAccounts get amount;
  @override
  InputDate get date;
  @override
  InputString get remarks;
  @override
  FormzStatus get status;
  @override
  @JsonKey(ignore: true)
  _$RegisterpaymentStateCopyWith<_RegisterpaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}
