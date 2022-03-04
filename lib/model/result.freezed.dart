// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ResultTearOff {
  const _$ResultTearOff();

  _Data<T, E> success<T, E>(T data) {
    return _Data<T, E>(
      data,
    );
  }

  _Error<T, E> error<T, E>(E e) {
    return _Error<T, E>(
      e,
    );
  }
}

/// @nodoc
const $Result = _$ResultTearOff();

/// @nodoc
mixin _$Result<T, E> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(E e) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(E e)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(E e)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data<T, E> value) success,
    required TResult Function(_Error<T, E> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data<T, E> value)? success,
    TResult Function(_Error<T, E> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data<T, E> value)? success,
    TResult Function(_Error<T, E> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<T, E, $Res> {
  factory $ResultCopyWith(
          Result<T, E> value, $Res Function(Result<T, E>) then) =
      _$ResultCopyWithImpl<T, E, $Res>;
}

/// @nodoc
class _$ResultCopyWithImpl<T, E, $Res> implements $ResultCopyWith<T, E, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  final Result<T, E> _value;
  // ignore: unused_field
  final $Res Function(Result<T, E>) _then;
}

/// @nodoc
abstract class _$DataCopyWith<T, E, $Res> {
  factory _$DataCopyWith(_Data<T, E> value, $Res Function(_Data<T, E>) then) =
      __$DataCopyWithImpl<T, E, $Res>;
  $Res call({T data});
}

/// @nodoc
class __$DataCopyWithImpl<T, E, $Res> extends _$ResultCopyWithImpl<T, E, $Res>
    implements _$DataCopyWith<T, E, $Res> {
  __$DataCopyWithImpl(_Data<T, E> _value, $Res Function(_Data<T, E>) _then)
      : super(_value, (v) => _then(v as _Data<T, E>));

  @override
  _Data<T, E> get _value => super._value as _Data<T, E>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_Data<T, E>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_Data<T, E> implements _Data<T, E> {
  const _$_Data(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'Result<$T, $E>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Data<T, E> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$DataCopyWith<T, E, _Data<T, E>> get copyWith =>
      __$DataCopyWithImpl<T, E, _Data<T, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(E e) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(E e)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(E e)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data<T, E> value) success,
    required TResult Function(_Error<T, E> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data<T, E> value)? success,
    TResult Function(_Error<T, E> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data<T, E> value)? success,
    TResult Function(_Error<T, E> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Data<T, E> implements Result<T, E> {
  const factory _Data(T data) = _$_Data<T, E>;

  T get data;
  @JsonKey(ignore: true)
  _$DataCopyWith<T, E, _Data<T, E>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<T, E, $Res> {
  factory _$ErrorCopyWith(
          _Error<T, E> value, $Res Function(_Error<T, E>) then) =
      __$ErrorCopyWithImpl<T, E, $Res>;
  $Res call({E e});
}

/// @nodoc
class __$ErrorCopyWithImpl<T, E, $Res> extends _$ResultCopyWithImpl<T, E, $Res>
    implements _$ErrorCopyWith<T, E, $Res> {
  __$ErrorCopyWithImpl(_Error<T, E> _value, $Res Function(_Error<T, E>) _then)
      : super(_value, (v) => _then(v as _Error<T, E>));

  @override
  _Error<T, E> get _value => super._value as _Error<T, E>;

  @override
  $Res call({
    Object? e = freezed,
  }) {
    return _then(_Error<T, E>(
      e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as E,
    ));
  }
}

/// @nodoc

class _$_Error<T, E> implements _Error<T, E> {
  const _$_Error(this.e);

  @override
  final E e;

  @override
  String toString() {
    return 'Result<$T, $E>.error(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error<T, E> &&
            const DeepCollectionEquality().equals(other.e, e));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e));

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<T, E, _Error<T, E>> get copyWith =>
      __$ErrorCopyWithImpl<T, E, _Error<T, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(E e) error,
  }) {
    return error(e);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(E e)? error,
  }) {
    return error?.call(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(E e)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data<T, E> value) success,
    required TResult Function(_Error<T, E> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data<T, E> value)? success,
    TResult Function(_Error<T, E> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data<T, E> value)? success,
    TResult Function(_Error<T, E> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error<T, E> implements Result<T, E> {
  const factory _Error(E e) = _$_Error<T, E>;

  E get e;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<T, E, _Error<T, E>> get copyWith =>
      throw _privateConstructorUsedError;
}
