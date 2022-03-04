// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'view_statement_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ViewStatementPageStateTearOff {
  const _$ViewStatementPageStateTearOff();

  _ViewStatementPageState call({Future<Uint8List>? pdfData}) {
    return _ViewStatementPageState(
      pdfData: pdfData,
    );
  }
}

/// @nodoc
const $ViewStatementPageState = _$ViewStatementPageStateTearOff();

/// @nodoc
mixin _$ViewStatementPageState {
  Future<Uint8List>? get pdfData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewStatementPageStateCopyWith<ViewStatementPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewStatementPageStateCopyWith<$Res> {
  factory $ViewStatementPageStateCopyWith(ViewStatementPageState value,
          $Res Function(ViewStatementPageState) then) =
      _$ViewStatementPageStateCopyWithImpl<$Res>;
  $Res call({Future<Uint8List>? pdfData});
}

/// @nodoc
class _$ViewStatementPageStateCopyWithImpl<$Res>
    implements $ViewStatementPageStateCopyWith<$Res> {
  _$ViewStatementPageStateCopyWithImpl(this._value, this._then);

  final ViewStatementPageState _value;
  // ignore: unused_field
  final $Res Function(ViewStatementPageState) _then;

  @override
  $Res call({
    Object? pdfData = freezed,
  }) {
    return _then(_value.copyWith(
      pdfData: pdfData == freezed
          ? _value.pdfData
          : pdfData // ignore: cast_nullable_to_non_nullable
              as Future<Uint8List>?,
    ));
  }
}

/// @nodoc
abstract class _$ViewStatementPageStateCopyWith<$Res>
    implements $ViewStatementPageStateCopyWith<$Res> {
  factory _$ViewStatementPageStateCopyWith(_ViewStatementPageState value,
          $Res Function(_ViewStatementPageState) then) =
      __$ViewStatementPageStateCopyWithImpl<$Res>;
  @override
  $Res call({Future<Uint8List>? pdfData});
}

/// @nodoc
class __$ViewStatementPageStateCopyWithImpl<$Res>
    extends _$ViewStatementPageStateCopyWithImpl<$Res>
    implements _$ViewStatementPageStateCopyWith<$Res> {
  __$ViewStatementPageStateCopyWithImpl(_ViewStatementPageState _value,
      $Res Function(_ViewStatementPageState) _then)
      : super(_value, (v) => _then(v as _ViewStatementPageState));

  @override
  _ViewStatementPageState get _value => super._value as _ViewStatementPageState;

  @override
  $Res call({
    Object? pdfData = freezed,
  }) {
    return _then(_ViewStatementPageState(
      pdfData: pdfData == freezed
          ? _value.pdfData
          : pdfData // ignore: cast_nullable_to_non_nullable
              as Future<Uint8List>?,
    ));
  }
}

/// @nodoc

class _$_ViewStatementPageState implements _ViewStatementPageState {
  const _$_ViewStatementPageState({this.pdfData});

  @override
  final Future<Uint8List>? pdfData;

  @override
  String toString() {
    return 'ViewStatementPageState(pdfData: $pdfData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ViewStatementPageState &&
            const DeepCollectionEquality().equals(other.pdfData, pdfData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(pdfData));

  @JsonKey(ignore: true)
  @override
  _$ViewStatementPageStateCopyWith<_ViewStatementPageState> get copyWith =>
      __$ViewStatementPageStateCopyWithImpl<_ViewStatementPageState>(
          this, _$identity);
}

abstract class _ViewStatementPageState implements ViewStatementPageState {
  const factory _ViewStatementPageState({Future<Uint8List>? pdfData}) =
      _$_ViewStatementPageState;

  @override
  Future<Uint8List>? get pdfData;
  @override
  @JsonKey(ignore: true)
  _$ViewStatementPageStateCopyWith<_ViewStatementPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
