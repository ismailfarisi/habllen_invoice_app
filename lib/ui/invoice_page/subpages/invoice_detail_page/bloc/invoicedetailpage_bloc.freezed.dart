// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'invoicedetailpage_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$InvoicedetailpageStateTearOff {
  const _$InvoicedetailpageStateTearOff();

  _InvoicedetailpageState call(
      {Status updateStatus = Status.initial, bool isEditableMode = false}) {
    return _InvoicedetailpageState(
      updateStatus: updateStatus,
      isEditableMode: isEditableMode,
    );
  }
}

/// @nodoc
const $InvoicedetailpageState = _$InvoicedetailpageStateTearOff();

/// @nodoc
mixin _$InvoicedetailpageState {
  Status get updateStatus => throw _privateConstructorUsedError;
  bool get isEditableMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InvoicedetailpageStateCopyWith<InvoicedetailpageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoicedetailpageStateCopyWith<$Res> {
  factory $InvoicedetailpageStateCopyWith(InvoicedetailpageState value,
          $Res Function(InvoicedetailpageState) then) =
      _$InvoicedetailpageStateCopyWithImpl<$Res>;
  $Res call({Status updateStatus, bool isEditableMode});
}

/// @nodoc
class _$InvoicedetailpageStateCopyWithImpl<$Res>
    implements $InvoicedetailpageStateCopyWith<$Res> {
  _$InvoicedetailpageStateCopyWithImpl(this._value, this._then);

  final InvoicedetailpageState _value;
  // ignore: unused_field
  final $Res Function(InvoicedetailpageState) _then;

  @override
  $Res call({
    Object? updateStatus = freezed,
    Object? isEditableMode = freezed,
  }) {
    return _then(_value.copyWith(
      updateStatus: updateStatus == freezed
          ? _value.updateStatus
          : updateStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      isEditableMode: isEditableMode == freezed
          ? _value.isEditableMode
          : isEditableMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$InvoicedetailpageStateCopyWith<$Res>
    implements $InvoicedetailpageStateCopyWith<$Res> {
  factory _$InvoicedetailpageStateCopyWith(_InvoicedetailpageState value,
          $Res Function(_InvoicedetailpageState) then) =
      __$InvoicedetailpageStateCopyWithImpl<$Res>;
  @override
  $Res call({Status updateStatus, bool isEditableMode});
}

/// @nodoc
class __$InvoicedetailpageStateCopyWithImpl<$Res>
    extends _$InvoicedetailpageStateCopyWithImpl<$Res>
    implements _$InvoicedetailpageStateCopyWith<$Res> {
  __$InvoicedetailpageStateCopyWithImpl(_InvoicedetailpageState _value,
      $Res Function(_InvoicedetailpageState) _then)
      : super(_value, (v) => _then(v as _InvoicedetailpageState));

  @override
  _InvoicedetailpageState get _value => super._value as _InvoicedetailpageState;

  @override
  $Res call({
    Object? updateStatus = freezed,
    Object? isEditableMode = freezed,
  }) {
    return _then(_InvoicedetailpageState(
      updateStatus: updateStatus == freezed
          ? _value.updateStatus
          : updateStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      isEditableMode: isEditableMode == freezed
          ? _value.isEditableMode
          : isEditableMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_InvoicedetailpageState implements _InvoicedetailpageState {
  const _$_InvoicedetailpageState(
      {this.updateStatus = Status.initial, this.isEditableMode = false});

  @JsonKey()
  @override
  final Status updateStatus;
  @JsonKey()
  @override
  final bool isEditableMode;

  @override
  String toString() {
    return 'InvoicedetailpageState(updateStatus: $updateStatus, isEditableMode: $isEditableMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvoicedetailpageState &&
            const DeepCollectionEquality()
                .equals(other.updateStatus, updateStatus) &&
            const DeepCollectionEquality()
                .equals(other.isEditableMode, isEditableMode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(updateStatus),
      const DeepCollectionEquality().hash(isEditableMode));

  @JsonKey(ignore: true)
  @override
  _$InvoicedetailpageStateCopyWith<_InvoicedetailpageState> get copyWith =>
      __$InvoicedetailpageStateCopyWithImpl<_InvoicedetailpageState>(
          this, _$identity);
}

abstract class _InvoicedetailpageState implements InvoicedetailpageState {
  const factory _InvoicedetailpageState(
      {Status updateStatus, bool isEditableMode}) = _$_InvoicedetailpageState;

  @override
  Status get updateStatus;
  @override
  bool get isEditableMode;
  @override
  @JsonKey(ignore: true)
  _$InvoicedetailpageStateCopyWith<_InvoicedetailpageState> get copyWith =>
      throw _privateConstructorUsedError;
}
