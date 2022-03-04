// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'customerdetail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CustomerDetailEventTearOff {
  const _$CustomerDetailEventTearOff();

  _Started started(String companyId) {
    return _Started(
      companyId,
    );
  }

  _FetchInvoiceList fetchInvoiceList() {
    return const _FetchInvoiceList();
  }

  _FetchPaymentList fetchPaymentList() {
    return const _FetchPaymentList();
  }

  _TabChanged tabChanged(int index) {
    return _TabChanged(
      index,
    );
  }

  _FilterModeChanged filterModeChanged(FilterMode mode,
      {DateTimeRange? dateRange}) {
    return _FilterModeChanged(
      mode,
      dateRange: dateRange,
    );
  }

  _DateRangeChanged dateRangeChanged(DateTimeRange dateTimeRange) {
    return _DateRangeChanged(
      dateTimeRange,
    );
  }
}

/// @nodoc
const $CustomerDetailEvent = _$CustomerDetailEventTearOff();

/// @nodoc
mixin _$CustomerDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String companyId) started,
    required TResult Function() fetchInvoiceList,
    required TResult Function() fetchPaymentList,
    required TResult Function(int index) tabChanged,
    required TResult Function(FilterMode mode, DateTimeRange? dateRange)
        filterModeChanged,
    required TResult Function(DateTimeRange dateTimeRange) dateRangeChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String companyId)? started,
    TResult Function()? fetchInvoiceList,
    TResult Function()? fetchPaymentList,
    TResult Function(int index)? tabChanged,
    TResult Function(FilterMode mode, DateTimeRange? dateRange)?
        filterModeChanged,
    TResult Function(DateTimeRange dateTimeRange)? dateRangeChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String companyId)? started,
    TResult Function()? fetchInvoiceList,
    TResult Function()? fetchPaymentList,
    TResult Function(int index)? tabChanged,
    TResult Function(FilterMode mode, DateTimeRange? dateRange)?
        filterModeChanged,
    TResult Function(DateTimeRange dateTimeRange)? dateRangeChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchInvoiceList value) fetchInvoiceList,
    required TResult Function(_FetchPaymentList value) fetchPaymentList,
    required TResult Function(_TabChanged value) tabChanged,
    required TResult Function(_FilterModeChanged value) filterModeChanged,
    required TResult Function(_DateRangeChanged value) dateRangeChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchInvoiceList value)? fetchInvoiceList,
    TResult Function(_FetchPaymentList value)? fetchPaymentList,
    TResult Function(_TabChanged value)? tabChanged,
    TResult Function(_FilterModeChanged value)? filterModeChanged,
    TResult Function(_DateRangeChanged value)? dateRangeChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchInvoiceList value)? fetchInvoiceList,
    TResult Function(_FetchPaymentList value)? fetchPaymentList,
    TResult Function(_TabChanged value)? tabChanged,
    TResult Function(_FilterModeChanged value)? filterModeChanged,
    TResult Function(_DateRangeChanged value)? dateRangeChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerDetailEventCopyWith<$Res> {
  factory $CustomerDetailEventCopyWith(
          CustomerDetailEvent value, $Res Function(CustomerDetailEvent) then) =
      _$CustomerDetailEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CustomerDetailEventCopyWithImpl<$Res>
    implements $CustomerDetailEventCopyWith<$Res> {
  _$CustomerDetailEventCopyWithImpl(this._value, this._then);

  final CustomerDetailEvent _value;
  // ignore: unused_field
  final $Res Function(CustomerDetailEvent) _then;
}

/// @nodoc
abstract class _$StartedCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) then) =
      __$StartedCopyWithImpl<$Res>;
  $Res call({String companyId});
}

/// @nodoc
class __$StartedCopyWithImpl<$Res>
    extends _$CustomerDetailEventCopyWithImpl<$Res>
    implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(_Started _value, $Res Function(_Started) _then)
      : super(_value, (v) => _then(v as _Started));

  @override
  _Started get _value => super._value as _Started;

  @override
  $Res call({
    Object? companyId = freezed,
  }) {
    return _then(_Started(
      companyId == freezed
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started(this.companyId);

  @override
  final String companyId;

  @override
  String toString() {
    return 'CustomerDetailEvent.started(companyId: $companyId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Started &&
            const DeepCollectionEquality().equals(other.companyId, companyId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(companyId));

  @JsonKey(ignore: true)
  @override
  _$StartedCopyWith<_Started> get copyWith =>
      __$StartedCopyWithImpl<_Started>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String companyId) started,
    required TResult Function() fetchInvoiceList,
    required TResult Function() fetchPaymentList,
    required TResult Function(int index) tabChanged,
    required TResult Function(FilterMode mode, DateTimeRange? dateRange)
        filterModeChanged,
    required TResult Function(DateTimeRange dateTimeRange) dateRangeChanged,
  }) {
    return started(companyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String companyId)? started,
    TResult Function()? fetchInvoiceList,
    TResult Function()? fetchPaymentList,
    TResult Function(int index)? tabChanged,
    TResult Function(FilterMode mode, DateTimeRange? dateRange)?
        filterModeChanged,
    TResult Function(DateTimeRange dateTimeRange)? dateRangeChanged,
  }) {
    return started?.call(companyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String companyId)? started,
    TResult Function()? fetchInvoiceList,
    TResult Function()? fetchPaymentList,
    TResult Function(int index)? tabChanged,
    TResult Function(FilterMode mode, DateTimeRange? dateRange)?
        filterModeChanged,
    TResult Function(DateTimeRange dateTimeRange)? dateRangeChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(companyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchInvoiceList value) fetchInvoiceList,
    required TResult Function(_FetchPaymentList value) fetchPaymentList,
    required TResult Function(_TabChanged value) tabChanged,
    required TResult Function(_FilterModeChanged value) filterModeChanged,
    required TResult Function(_DateRangeChanged value) dateRangeChanged,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchInvoiceList value)? fetchInvoiceList,
    TResult Function(_FetchPaymentList value)? fetchPaymentList,
    TResult Function(_TabChanged value)? tabChanged,
    TResult Function(_FilterModeChanged value)? filterModeChanged,
    TResult Function(_DateRangeChanged value)? dateRangeChanged,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchInvoiceList value)? fetchInvoiceList,
    TResult Function(_FetchPaymentList value)? fetchPaymentList,
    TResult Function(_TabChanged value)? tabChanged,
    TResult Function(_FilterModeChanged value)? filterModeChanged,
    TResult Function(_DateRangeChanged value)? dateRangeChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CustomerDetailEvent {
  const factory _Started(String companyId) = _$_Started;

  String get companyId;
  @JsonKey(ignore: true)
  _$StartedCopyWith<_Started> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FetchInvoiceListCopyWith<$Res> {
  factory _$FetchInvoiceListCopyWith(
          _FetchInvoiceList value, $Res Function(_FetchInvoiceList) then) =
      __$FetchInvoiceListCopyWithImpl<$Res>;
}

/// @nodoc
class __$FetchInvoiceListCopyWithImpl<$Res>
    extends _$CustomerDetailEventCopyWithImpl<$Res>
    implements _$FetchInvoiceListCopyWith<$Res> {
  __$FetchInvoiceListCopyWithImpl(
      _FetchInvoiceList _value, $Res Function(_FetchInvoiceList) _then)
      : super(_value, (v) => _then(v as _FetchInvoiceList));

  @override
  _FetchInvoiceList get _value => super._value as _FetchInvoiceList;
}

/// @nodoc

class _$_FetchInvoiceList implements _FetchInvoiceList {
  const _$_FetchInvoiceList();

  @override
  String toString() {
    return 'CustomerDetailEvent.fetchInvoiceList()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _FetchInvoiceList);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String companyId) started,
    required TResult Function() fetchInvoiceList,
    required TResult Function() fetchPaymentList,
    required TResult Function(int index) tabChanged,
    required TResult Function(FilterMode mode, DateTimeRange? dateRange)
        filterModeChanged,
    required TResult Function(DateTimeRange dateTimeRange) dateRangeChanged,
  }) {
    return fetchInvoiceList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String companyId)? started,
    TResult Function()? fetchInvoiceList,
    TResult Function()? fetchPaymentList,
    TResult Function(int index)? tabChanged,
    TResult Function(FilterMode mode, DateTimeRange? dateRange)?
        filterModeChanged,
    TResult Function(DateTimeRange dateTimeRange)? dateRangeChanged,
  }) {
    return fetchInvoiceList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String companyId)? started,
    TResult Function()? fetchInvoiceList,
    TResult Function()? fetchPaymentList,
    TResult Function(int index)? tabChanged,
    TResult Function(FilterMode mode, DateTimeRange? dateRange)?
        filterModeChanged,
    TResult Function(DateTimeRange dateTimeRange)? dateRangeChanged,
    required TResult orElse(),
  }) {
    if (fetchInvoiceList != null) {
      return fetchInvoiceList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchInvoiceList value) fetchInvoiceList,
    required TResult Function(_FetchPaymentList value) fetchPaymentList,
    required TResult Function(_TabChanged value) tabChanged,
    required TResult Function(_FilterModeChanged value) filterModeChanged,
    required TResult Function(_DateRangeChanged value) dateRangeChanged,
  }) {
    return fetchInvoiceList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchInvoiceList value)? fetchInvoiceList,
    TResult Function(_FetchPaymentList value)? fetchPaymentList,
    TResult Function(_TabChanged value)? tabChanged,
    TResult Function(_FilterModeChanged value)? filterModeChanged,
    TResult Function(_DateRangeChanged value)? dateRangeChanged,
  }) {
    return fetchInvoiceList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchInvoiceList value)? fetchInvoiceList,
    TResult Function(_FetchPaymentList value)? fetchPaymentList,
    TResult Function(_TabChanged value)? tabChanged,
    TResult Function(_FilterModeChanged value)? filterModeChanged,
    TResult Function(_DateRangeChanged value)? dateRangeChanged,
    required TResult orElse(),
  }) {
    if (fetchInvoiceList != null) {
      return fetchInvoiceList(this);
    }
    return orElse();
  }
}

abstract class _FetchInvoiceList implements CustomerDetailEvent {
  const factory _FetchInvoiceList() = _$_FetchInvoiceList;
}

/// @nodoc
abstract class _$FetchPaymentListCopyWith<$Res> {
  factory _$FetchPaymentListCopyWith(
          _FetchPaymentList value, $Res Function(_FetchPaymentList) then) =
      __$FetchPaymentListCopyWithImpl<$Res>;
}

/// @nodoc
class __$FetchPaymentListCopyWithImpl<$Res>
    extends _$CustomerDetailEventCopyWithImpl<$Res>
    implements _$FetchPaymentListCopyWith<$Res> {
  __$FetchPaymentListCopyWithImpl(
      _FetchPaymentList _value, $Res Function(_FetchPaymentList) _then)
      : super(_value, (v) => _then(v as _FetchPaymentList));

  @override
  _FetchPaymentList get _value => super._value as _FetchPaymentList;
}

/// @nodoc

class _$_FetchPaymentList implements _FetchPaymentList {
  const _$_FetchPaymentList();

  @override
  String toString() {
    return 'CustomerDetailEvent.fetchPaymentList()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _FetchPaymentList);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String companyId) started,
    required TResult Function() fetchInvoiceList,
    required TResult Function() fetchPaymentList,
    required TResult Function(int index) tabChanged,
    required TResult Function(FilterMode mode, DateTimeRange? dateRange)
        filterModeChanged,
    required TResult Function(DateTimeRange dateTimeRange) dateRangeChanged,
  }) {
    return fetchPaymentList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String companyId)? started,
    TResult Function()? fetchInvoiceList,
    TResult Function()? fetchPaymentList,
    TResult Function(int index)? tabChanged,
    TResult Function(FilterMode mode, DateTimeRange? dateRange)?
        filterModeChanged,
    TResult Function(DateTimeRange dateTimeRange)? dateRangeChanged,
  }) {
    return fetchPaymentList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String companyId)? started,
    TResult Function()? fetchInvoiceList,
    TResult Function()? fetchPaymentList,
    TResult Function(int index)? tabChanged,
    TResult Function(FilterMode mode, DateTimeRange? dateRange)?
        filterModeChanged,
    TResult Function(DateTimeRange dateTimeRange)? dateRangeChanged,
    required TResult orElse(),
  }) {
    if (fetchPaymentList != null) {
      return fetchPaymentList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchInvoiceList value) fetchInvoiceList,
    required TResult Function(_FetchPaymentList value) fetchPaymentList,
    required TResult Function(_TabChanged value) tabChanged,
    required TResult Function(_FilterModeChanged value) filterModeChanged,
    required TResult Function(_DateRangeChanged value) dateRangeChanged,
  }) {
    return fetchPaymentList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchInvoiceList value)? fetchInvoiceList,
    TResult Function(_FetchPaymentList value)? fetchPaymentList,
    TResult Function(_TabChanged value)? tabChanged,
    TResult Function(_FilterModeChanged value)? filterModeChanged,
    TResult Function(_DateRangeChanged value)? dateRangeChanged,
  }) {
    return fetchPaymentList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchInvoiceList value)? fetchInvoiceList,
    TResult Function(_FetchPaymentList value)? fetchPaymentList,
    TResult Function(_TabChanged value)? tabChanged,
    TResult Function(_FilterModeChanged value)? filterModeChanged,
    TResult Function(_DateRangeChanged value)? dateRangeChanged,
    required TResult orElse(),
  }) {
    if (fetchPaymentList != null) {
      return fetchPaymentList(this);
    }
    return orElse();
  }
}

abstract class _FetchPaymentList implements CustomerDetailEvent {
  const factory _FetchPaymentList() = _$_FetchPaymentList;
}

/// @nodoc
abstract class _$TabChangedCopyWith<$Res> {
  factory _$TabChangedCopyWith(
          _TabChanged value, $Res Function(_TabChanged) then) =
      __$TabChangedCopyWithImpl<$Res>;
  $Res call({int index});
}

/// @nodoc
class __$TabChangedCopyWithImpl<$Res>
    extends _$CustomerDetailEventCopyWithImpl<$Res>
    implements _$TabChangedCopyWith<$Res> {
  __$TabChangedCopyWithImpl(
      _TabChanged _value, $Res Function(_TabChanged) _then)
      : super(_value, (v) => _then(v as _TabChanged));

  @override
  _TabChanged get _value => super._value as _TabChanged;

  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_TabChanged(
      index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TabChanged implements _TabChanged {
  const _$_TabChanged(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'CustomerDetailEvent.tabChanged(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TabChanged &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$TabChangedCopyWith<_TabChanged> get copyWith =>
      __$TabChangedCopyWithImpl<_TabChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String companyId) started,
    required TResult Function() fetchInvoiceList,
    required TResult Function() fetchPaymentList,
    required TResult Function(int index) tabChanged,
    required TResult Function(FilterMode mode, DateTimeRange? dateRange)
        filterModeChanged,
    required TResult Function(DateTimeRange dateTimeRange) dateRangeChanged,
  }) {
    return tabChanged(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String companyId)? started,
    TResult Function()? fetchInvoiceList,
    TResult Function()? fetchPaymentList,
    TResult Function(int index)? tabChanged,
    TResult Function(FilterMode mode, DateTimeRange? dateRange)?
        filterModeChanged,
    TResult Function(DateTimeRange dateTimeRange)? dateRangeChanged,
  }) {
    return tabChanged?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String companyId)? started,
    TResult Function()? fetchInvoiceList,
    TResult Function()? fetchPaymentList,
    TResult Function(int index)? tabChanged,
    TResult Function(FilterMode mode, DateTimeRange? dateRange)?
        filterModeChanged,
    TResult Function(DateTimeRange dateTimeRange)? dateRangeChanged,
    required TResult orElse(),
  }) {
    if (tabChanged != null) {
      return tabChanged(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchInvoiceList value) fetchInvoiceList,
    required TResult Function(_FetchPaymentList value) fetchPaymentList,
    required TResult Function(_TabChanged value) tabChanged,
    required TResult Function(_FilterModeChanged value) filterModeChanged,
    required TResult Function(_DateRangeChanged value) dateRangeChanged,
  }) {
    return tabChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchInvoiceList value)? fetchInvoiceList,
    TResult Function(_FetchPaymentList value)? fetchPaymentList,
    TResult Function(_TabChanged value)? tabChanged,
    TResult Function(_FilterModeChanged value)? filterModeChanged,
    TResult Function(_DateRangeChanged value)? dateRangeChanged,
  }) {
    return tabChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchInvoiceList value)? fetchInvoiceList,
    TResult Function(_FetchPaymentList value)? fetchPaymentList,
    TResult Function(_TabChanged value)? tabChanged,
    TResult Function(_FilterModeChanged value)? filterModeChanged,
    TResult Function(_DateRangeChanged value)? dateRangeChanged,
    required TResult orElse(),
  }) {
    if (tabChanged != null) {
      return tabChanged(this);
    }
    return orElse();
  }
}

abstract class _TabChanged implements CustomerDetailEvent {
  const factory _TabChanged(int index) = _$_TabChanged;

  int get index;
  @JsonKey(ignore: true)
  _$TabChangedCopyWith<_TabChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FilterModeChangedCopyWith<$Res> {
  factory _$FilterModeChangedCopyWith(
          _FilterModeChanged value, $Res Function(_FilterModeChanged) then) =
      __$FilterModeChangedCopyWithImpl<$Res>;
  $Res call({FilterMode mode, DateTimeRange? dateRange});
}

/// @nodoc
class __$FilterModeChangedCopyWithImpl<$Res>
    extends _$CustomerDetailEventCopyWithImpl<$Res>
    implements _$FilterModeChangedCopyWith<$Res> {
  __$FilterModeChangedCopyWithImpl(
      _FilterModeChanged _value, $Res Function(_FilterModeChanged) _then)
      : super(_value, (v) => _then(v as _FilterModeChanged));

  @override
  _FilterModeChanged get _value => super._value as _FilterModeChanged;

  @override
  $Res call({
    Object? mode = freezed,
    Object? dateRange = freezed,
  }) {
    return _then(_FilterModeChanged(
      mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as FilterMode,
      dateRange: dateRange == freezed
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange?,
    ));
  }
}

/// @nodoc

class _$_FilterModeChanged implements _FilterModeChanged {
  const _$_FilterModeChanged(this.mode, {this.dateRange});

  @override
  final FilterMode mode;
  @override
  final DateTimeRange? dateRange;

  @override
  String toString() {
    return 'CustomerDetailEvent.filterModeChanged(mode: $mode, dateRange: $dateRange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FilterModeChanged &&
            const DeepCollectionEquality().equals(other.mode, mode) &&
            const DeepCollectionEquality().equals(other.dateRange, dateRange));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(mode),
      const DeepCollectionEquality().hash(dateRange));

  @JsonKey(ignore: true)
  @override
  _$FilterModeChangedCopyWith<_FilterModeChanged> get copyWith =>
      __$FilterModeChangedCopyWithImpl<_FilterModeChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String companyId) started,
    required TResult Function() fetchInvoiceList,
    required TResult Function() fetchPaymentList,
    required TResult Function(int index) tabChanged,
    required TResult Function(FilterMode mode, DateTimeRange? dateRange)
        filterModeChanged,
    required TResult Function(DateTimeRange dateTimeRange) dateRangeChanged,
  }) {
    return filterModeChanged(mode, dateRange);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String companyId)? started,
    TResult Function()? fetchInvoiceList,
    TResult Function()? fetchPaymentList,
    TResult Function(int index)? tabChanged,
    TResult Function(FilterMode mode, DateTimeRange? dateRange)?
        filterModeChanged,
    TResult Function(DateTimeRange dateTimeRange)? dateRangeChanged,
  }) {
    return filterModeChanged?.call(mode, dateRange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String companyId)? started,
    TResult Function()? fetchInvoiceList,
    TResult Function()? fetchPaymentList,
    TResult Function(int index)? tabChanged,
    TResult Function(FilterMode mode, DateTimeRange? dateRange)?
        filterModeChanged,
    TResult Function(DateTimeRange dateTimeRange)? dateRangeChanged,
    required TResult orElse(),
  }) {
    if (filterModeChanged != null) {
      return filterModeChanged(mode, dateRange);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchInvoiceList value) fetchInvoiceList,
    required TResult Function(_FetchPaymentList value) fetchPaymentList,
    required TResult Function(_TabChanged value) tabChanged,
    required TResult Function(_FilterModeChanged value) filterModeChanged,
    required TResult Function(_DateRangeChanged value) dateRangeChanged,
  }) {
    return filterModeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchInvoiceList value)? fetchInvoiceList,
    TResult Function(_FetchPaymentList value)? fetchPaymentList,
    TResult Function(_TabChanged value)? tabChanged,
    TResult Function(_FilterModeChanged value)? filterModeChanged,
    TResult Function(_DateRangeChanged value)? dateRangeChanged,
  }) {
    return filterModeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchInvoiceList value)? fetchInvoiceList,
    TResult Function(_FetchPaymentList value)? fetchPaymentList,
    TResult Function(_TabChanged value)? tabChanged,
    TResult Function(_FilterModeChanged value)? filterModeChanged,
    TResult Function(_DateRangeChanged value)? dateRangeChanged,
    required TResult orElse(),
  }) {
    if (filterModeChanged != null) {
      return filterModeChanged(this);
    }
    return orElse();
  }
}

abstract class _FilterModeChanged implements CustomerDetailEvent {
  const factory _FilterModeChanged(FilterMode mode,
      {DateTimeRange? dateRange}) = _$_FilterModeChanged;

  FilterMode get mode;
  DateTimeRange? get dateRange;
  @JsonKey(ignore: true)
  _$FilterModeChangedCopyWith<_FilterModeChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DateRangeChangedCopyWith<$Res> {
  factory _$DateRangeChangedCopyWith(
          _DateRangeChanged value, $Res Function(_DateRangeChanged) then) =
      __$DateRangeChangedCopyWithImpl<$Res>;
  $Res call({DateTimeRange dateTimeRange});
}

/// @nodoc
class __$DateRangeChangedCopyWithImpl<$Res>
    extends _$CustomerDetailEventCopyWithImpl<$Res>
    implements _$DateRangeChangedCopyWith<$Res> {
  __$DateRangeChangedCopyWithImpl(
      _DateRangeChanged _value, $Res Function(_DateRangeChanged) _then)
      : super(_value, (v) => _then(v as _DateRangeChanged));

  @override
  _DateRangeChanged get _value => super._value as _DateRangeChanged;

  @override
  $Res call({
    Object? dateTimeRange = freezed,
  }) {
    return _then(_DateRangeChanged(
      dateTimeRange == freezed
          ? _value.dateTimeRange
          : dateTimeRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange,
    ));
  }
}

/// @nodoc

class _$_DateRangeChanged implements _DateRangeChanged {
  const _$_DateRangeChanged(this.dateTimeRange);

  @override
  final DateTimeRange dateTimeRange;

  @override
  String toString() {
    return 'CustomerDetailEvent.dateRangeChanged(dateTimeRange: $dateTimeRange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DateRangeChanged &&
            const DeepCollectionEquality()
                .equals(other.dateTimeRange, dateTimeRange));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(dateTimeRange));

  @JsonKey(ignore: true)
  @override
  _$DateRangeChangedCopyWith<_DateRangeChanged> get copyWith =>
      __$DateRangeChangedCopyWithImpl<_DateRangeChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String companyId) started,
    required TResult Function() fetchInvoiceList,
    required TResult Function() fetchPaymentList,
    required TResult Function(int index) tabChanged,
    required TResult Function(FilterMode mode, DateTimeRange? dateRange)
        filterModeChanged,
    required TResult Function(DateTimeRange dateTimeRange) dateRangeChanged,
  }) {
    return dateRangeChanged(dateTimeRange);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String companyId)? started,
    TResult Function()? fetchInvoiceList,
    TResult Function()? fetchPaymentList,
    TResult Function(int index)? tabChanged,
    TResult Function(FilterMode mode, DateTimeRange? dateRange)?
        filterModeChanged,
    TResult Function(DateTimeRange dateTimeRange)? dateRangeChanged,
  }) {
    return dateRangeChanged?.call(dateTimeRange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String companyId)? started,
    TResult Function()? fetchInvoiceList,
    TResult Function()? fetchPaymentList,
    TResult Function(int index)? tabChanged,
    TResult Function(FilterMode mode, DateTimeRange? dateRange)?
        filterModeChanged,
    TResult Function(DateTimeRange dateTimeRange)? dateRangeChanged,
    required TResult orElse(),
  }) {
    if (dateRangeChanged != null) {
      return dateRangeChanged(dateTimeRange);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_FetchInvoiceList value) fetchInvoiceList,
    required TResult Function(_FetchPaymentList value) fetchPaymentList,
    required TResult Function(_TabChanged value) tabChanged,
    required TResult Function(_FilterModeChanged value) filterModeChanged,
    required TResult Function(_DateRangeChanged value) dateRangeChanged,
  }) {
    return dateRangeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchInvoiceList value)? fetchInvoiceList,
    TResult Function(_FetchPaymentList value)? fetchPaymentList,
    TResult Function(_TabChanged value)? tabChanged,
    TResult Function(_FilterModeChanged value)? filterModeChanged,
    TResult Function(_DateRangeChanged value)? dateRangeChanged,
  }) {
    return dateRangeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_FetchInvoiceList value)? fetchInvoiceList,
    TResult Function(_FetchPaymentList value)? fetchPaymentList,
    TResult Function(_TabChanged value)? tabChanged,
    TResult Function(_FilterModeChanged value)? filterModeChanged,
    TResult Function(_DateRangeChanged value)? dateRangeChanged,
    required TResult orElse(),
  }) {
    if (dateRangeChanged != null) {
      return dateRangeChanged(this);
    }
    return orElse();
  }
}

abstract class _DateRangeChanged implements CustomerDetailEvent {
  const factory _DateRangeChanged(DateTimeRange dateTimeRange) =
      _$_DateRangeChanged;

  DateTimeRange get dateTimeRange;
  @JsonKey(ignore: true)
  _$DateRangeChangedCopyWith<_DateRangeChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$CustomerDetailStateTearOff {
  const _$CustomerDetailStateTearOff();

  _CustomerDetailState call(
      {String? companyId,
      List<Invoice> invoiceList = const [],
      List<Payment> paymentList = const [],
      Status invoiceListFetchStatus = Status.initial,
      Status paymentListFetchStatus = Status.initial,
      required DateTimeRange dateRange,
      int tab = 0,
      double totalInvoiceAmount = 0.0,
      double totalPaymentReceived = 0.0,
      required FilterMode filterMode}) {
    return _CustomerDetailState(
      companyId: companyId,
      invoiceList: invoiceList,
      paymentList: paymentList,
      invoiceListFetchStatus: invoiceListFetchStatus,
      paymentListFetchStatus: paymentListFetchStatus,
      dateRange: dateRange,
      tab: tab,
      totalInvoiceAmount: totalInvoiceAmount,
      totalPaymentReceived: totalPaymentReceived,
      filterMode: filterMode,
    );
  }
}

/// @nodoc
const $CustomerDetailState = _$CustomerDetailStateTearOff();

/// @nodoc
mixin _$CustomerDetailState {
  String? get companyId => throw _privateConstructorUsedError;
  List<Invoice> get invoiceList => throw _privateConstructorUsedError;
  List<Payment> get paymentList => throw _privateConstructorUsedError;
  Status get invoiceListFetchStatus => throw _privateConstructorUsedError;
  Status get paymentListFetchStatus => throw _privateConstructorUsedError;
  DateTimeRange get dateRange => throw _privateConstructorUsedError;
  int get tab => throw _privateConstructorUsedError;
  double get totalInvoiceAmount => throw _privateConstructorUsedError;
  double get totalPaymentReceived => throw _privateConstructorUsedError;
  FilterMode get filterMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerDetailStateCopyWith<CustomerDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerDetailStateCopyWith<$Res> {
  factory $CustomerDetailStateCopyWith(
          CustomerDetailState value, $Res Function(CustomerDetailState) then) =
      _$CustomerDetailStateCopyWithImpl<$Res>;
  $Res call(
      {String? companyId,
      List<Invoice> invoiceList,
      List<Payment> paymentList,
      Status invoiceListFetchStatus,
      Status paymentListFetchStatus,
      DateTimeRange dateRange,
      int tab,
      double totalInvoiceAmount,
      double totalPaymentReceived,
      FilterMode filterMode});
}

/// @nodoc
class _$CustomerDetailStateCopyWithImpl<$Res>
    implements $CustomerDetailStateCopyWith<$Res> {
  _$CustomerDetailStateCopyWithImpl(this._value, this._then);

  final CustomerDetailState _value;
  // ignore: unused_field
  final $Res Function(CustomerDetailState) _then;

  @override
  $Res call({
    Object? companyId = freezed,
    Object? invoiceList = freezed,
    Object? paymentList = freezed,
    Object? invoiceListFetchStatus = freezed,
    Object? paymentListFetchStatus = freezed,
    Object? dateRange = freezed,
    Object? tab = freezed,
    Object? totalInvoiceAmount = freezed,
    Object? totalPaymentReceived = freezed,
    Object? filterMode = freezed,
  }) {
    return _then(_value.copyWith(
      companyId: companyId == freezed
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String?,
      invoiceList: invoiceList == freezed
          ? _value.invoiceList
          : invoiceList // ignore: cast_nullable_to_non_nullable
              as List<Invoice>,
      paymentList: paymentList == freezed
          ? _value.paymentList
          : paymentList // ignore: cast_nullable_to_non_nullable
              as List<Payment>,
      invoiceListFetchStatus: invoiceListFetchStatus == freezed
          ? _value.invoiceListFetchStatus
          : invoiceListFetchStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      paymentListFetchStatus: paymentListFetchStatus == freezed
          ? _value.paymentListFetchStatus
          : paymentListFetchStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      dateRange: dateRange == freezed
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange,
      tab: tab == freezed
          ? _value.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as int,
      totalInvoiceAmount: totalInvoiceAmount == freezed
          ? _value.totalInvoiceAmount
          : totalInvoiceAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalPaymentReceived: totalPaymentReceived == freezed
          ? _value.totalPaymentReceived
          : totalPaymentReceived // ignore: cast_nullable_to_non_nullable
              as double,
      filterMode: filterMode == freezed
          ? _value.filterMode
          : filterMode // ignore: cast_nullable_to_non_nullable
              as FilterMode,
    ));
  }
}

/// @nodoc
abstract class _$CustomerDetailStateCopyWith<$Res>
    implements $CustomerDetailStateCopyWith<$Res> {
  factory _$CustomerDetailStateCopyWith(_CustomerDetailState value,
          $Res Function(_CustomerDetailState) then) =
      __$CustomerDetailStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? companyId,
      List<Invoice> invoiceList,
      List<Payment> paymentList,
      Status invoiceListFetchStatus,
      Status paymentListFetchStatus,
      DateTimeRange dateRange,
      int tab,
      double totalInvoiceAmount,
      double totalPaymentReceived,
      FilterMode filterMode});
}

/// @nodoc
class __$CustomerDetailStateCopyWithImpl<$Res>
    extends _$CustomerDetailStateCopyWithImpl<$Res>
    implements _$CustomerDetailStateCopyWith<$Res> {
  __$CustomerDetailStateCopyWithImpl(
      _CustomerDetailState _value, $Res Function(_CustomerDetailState) _then)
      : super(_value, (v) => _then(v as _CustomerDetailState));

  @override
  _CustomerDetailState get _value => super._value as _CustomerDetailState;

  @override
  $Res call({
    Object? companyId = freezed,
    Object? invoiceList = freezed,
    Object? paymentList = freezed,
    Object? invoiceListFetchStatus = freezed,
    Object? paymentListFetchStatus = freezed,
    Object? dateRange = freezed,
    Object? tab = freezed,
    Object? totalInvoiceAmount = freezed,
    Object? totalPaymentReceived = freezed,
    Object? filterMode = freezed,
  }) {
    return _then(_CustomerDetailState(
      companyId: companyId == freezed
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String?,
      invoiceList: invoiceList == freezed
          ? _value.invoiceList
          : invoiceList // ignore: cast_nullable_to_non_nullable
              as List<Invoice>,
      paymentList: paymentList == freezed
          ? _value.paymentList
          : paymentList // ignore: cast_nullable_to_non_nullable
              as List<Payment>,
      invoiceListFetchStatus: invoiceListFetchStatus == freezed
          ? _value.invoiceListFetchStatus
          : invoiceListFetchStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      paymentListFetchStatus: paymentListFetchStatus == freezed
          ? _value.paymentListFetchStatus
          : paymentListFetchStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      dateRange: dateRange == freezed
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange,
      tab: tab == freezed
          ? _value.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as int,
      totalInvoiceAmount: totalInvoiceAmount == freezed
          ? _value.totalInvoiceAmount
          : totalInvoiceAmount // ignore: cast_nullable_to_non_nullable
              as double,
      totalPaymentReceived: totalPaymentReceived == freezed
          ? _value.totalPaymentReceived
          : totalPaymentReceived // ignore: cast_nullable_to_non_nullable
              as double,
      filterMode: filterMode == freezed
          ? _value.filterMode
          : filterMode // ignore: cast_nullable_to_non_nullable
              as FilterMode,
    ));
  }
}

/// @nodoc

class _$_CustomerDetailState implements _CustomerDetailState {
  const _$_CustomerDetailState(
      {this.companyId,
      this.invoiceList = const [],
      this.paymentList = const [],
      this.invoiceListFetchStatus = Status.initial,
      this.paymentListFetchStatus = Status.initial,
      required this.dateRange,
      this.tab = 0,
      this.totalInvoiceAmount = 0.0,
      this.totalPaymentReceived = 0.0,
      required this.filterMode});

  @override
  final String? companyId;
  @JsonKey()
  @override
  final List<Invoice> invoiceList;
  @JsonKey()
  @override
  final List<Payment> paymentList;
  @JsonKey()
  @override
  final Status invoiceListFetchStatus;
  @JsonKey()
  @override
  final Status paymentListFetchStatus;
  @override
  final DateTimeRange dateRange;
  @JsonKey()
  @override
  final int tab;
  @JsonKey()
  @override
  final double totalInvoiceAmount;
  @JsonKey()
  @override
  final double totalPaymentReceived;
  @override
  final FilterMode filterMode;

  @override
  String toString() {
    return 'CustomerDetailState(companyId: $companyId, invoiceList: $invoiceList, paymentList: $paymentList, invoiceListFetchStatus: $invoiceListFetchStatus, paymentListFetchStatus: $paymentListFetchStatus, dateRange: $dateRange, tab: $tab, totalInvoiceAmount: $totalInvoiceAmount, totalPaymentReceived: $totalPaymentReceived, filterMode: $filterMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerDetailState &&
            const DeepCollectionEquality().equals(other.companyId, companyId) &&
            const DeepCollectionEquality()
                .equals(other.invoiceList, invoiceList) &&
            const DeepCollectionEquality()
                .equals(other.paymentList, paymentList) &&
            const DeepCollectionEquality()
                .equals(other.invoiceListFetchStatus, invoiceListFetchStatus) &&
            const DeepCollectionEquality()
                .equals(other.paymentListFetchStatus, paymentListFetchStatus) &&
            const DeepCollectionEquality().equals(other.dateRange, dateRange) &&
            const DeepCollectionEquality().equals(other.tab, tab) &&
            const DeepCollectionEquality()
                .equals(other.totalInvoiceAmount, totalInvoiceAmount) &&
            const DeepCollectionEquality()
                .equals(other.totalPaymentReceived, totalPaymentReceived) &&
            const DeepCollectionEquality()
                .equals(other.filterMode, filterMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(companyId),
      const DeepCollectionEquality().hash(invoiceList),
      const DeepCollectionEquality().hash(paymentList),
      const DeepCollectionEquality().hash(invoiceListFetchStatus),
      const DeepCollectionEquality().hash(paymentListFetchStatus),
      const DeepCollectionEquality().hash(dateRange),
      const DeepCollectionEquality().hash(tab),
      const DeepCollectionEquality().hash(totalInvoiceAmount),
      const DeepCollectionEquality().hash(totalPaymentReceived),
      const DeepCollectionEquality().hash(filterMode));

  @JsonKey(ignore: true)
  @override
  _$CustomerDetailStateCopyWith<_CustomerDetailState> get copyWith =>
      __$CustomerDetailStateCopyWithImpl<_CustomerDetailState>(
          this, _$identity);
}

abstract class _CustomerDetailState implements CustomerDetailState {
  const factory _CustomerDetailState(
      {String? companyId,
      List<Invoice> invoiceList,
      List<Payment> paymentList,
      Status invoiceListFetchStatus,
      Status paymentListFetchStatus,
      required DateTimeRange dateRange,
      int tab,
      double totalInvoiceAmount,
      double totalPaymentReceived,
      required FilterMode filterMode}) = _$_CustomerDetailState;

  @override
  String? get companyId;
  @override
  List<Invoice> get invoiceList;
  @override
  List<Payment> get paymentList;
  @override
  Status get invoiceListFetchStatus;
  @override
  Status get paymentListFetchStatus;
  @override
  DateTimeRange get dateRange;
  @override
  int get tab;
  @override
  double get totalInvoiceAmount;
  @override
  double get totalPaymentReceived;
  @override
  FilterMode get filterMode;
  @override
  @JsonKey(ignore: true)
  _$CustomerDetailStateCopyWith<_CustomerDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
