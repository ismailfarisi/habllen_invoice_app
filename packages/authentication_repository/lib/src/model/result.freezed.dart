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

  _Data<L, E> value<L, E>(L value) {
    return _Data<L, E>(
      value,
    );
  }

  _Error<L, E> error<L, E>(E value) {
    return _Error<L, E>(
      value,
    );
  }

  _None<L, E> none<L, E>() {
    return _None<L, E>();
  }
}

/// @nodoc
const $Result = _$ResultTearOff();

/// @nodoc
mixin _$Result<L, E> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(L value) value,
    required TResult Function(E value) error,
    required TResult Function() none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(L value)? value,
    TResult Function(E value)? error,
    TResult Function()? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(L value)? value,
    TResult Function(E value)? error,
    TResult Function()? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data<L, E> value) value,
    required TResult Function(_Error<L, E> value) error,
    required TResult Function(_None<L, E> value) none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data<L, E> value)? value,
    TResult Function(_Error<L, E> value)? error,
    TResult Function(_None<L, E> value)? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data<L, E> value)? value,
    TResult Function(_Error<L, E> value)? error,
    TResult Function(_None<L, E> value)? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<L, E, $Res> {
  factory $ResultCopyWith(
          Result<L, E> value, $Res Function(Result<L, E>) then) =
      _$ResultCopyWithImpl<L, E, $Res>;
}

/// @nodoc
class _$ResultCopyWithImpl<L, E, $Res> implements $ResultCopyWith<L, E, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  final Result<L, E> _value;
  // ignore: unused_field
  final $Res Function(Result<L, E>) _then;
}

/// @nodoc
abstract class _$DataCopyWith<L, E, $Res> {
  factory _$DataCopyWith(_Data<L, E> value, $Res Function(_Data<L, E>) then) =
      __$DataCopyWithImpl<L, E, $Res>;
  $Res call({L value});
}

/// @nodoc
class __$DataCopyWithImpl<L, E, $Res> extends _$ResultCopyWithImpl<L, E, $Res>
    implements _$DataCopyWith<L, E, $Res> {
  __$DataCopyWithImpl(_Data<L, E> _value, $Res Function(_Data<L, E>) _then)
      : super(_value, (v) => _then(v as _Data<L, E>));

  @override
  _Data<L, E> get _value => super._value as _Data<L, E>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_Data<L, E>(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as L,
    ));
  }
}

/// @nodoc

class _$_Data<L, E> implements _Data<L, E> {
  const _$_Data(this.value);

  @override
  final L value;

  @override
  String toString() {
    return 'Result<$L, $E>.value(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Data<L, E> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$DataCopyWith<L, E, _Data<L, E>> get copyWith =>
      __$DataCopyWithImpl<L, E, _Data<L, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(L value) value,
    required TResult Function(E value) error,
    required TResult Function() none,
  }) {
    return value(this.value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(L value)? value,
    TResult Function(E value)? error,
    TResult Function()? none,
  }) {
    return value?.call(this.value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(L value)? value,
    TResult Function(E value)? error,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (value != null) {
      return value(this.value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data<L, E> value) value,
    required TResult Function(_Error<L, E> value) error,
    required TResult Function(_None<L, E> value) none,
  }) {
    return value(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data<L, E> value)? value,
    TResult Function(_Error<L, E> value)? error,
    TResult Function(_None<L, E> value)? none,
  }) {
    return value?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data<L, E> value)? value,
    TResult Function(_Error<L, E> value)? error,
    TResult Function(_None<L, E> value)? none,
    required TResult orElse(),
  }) {
    if (value != null) {
      return value(this);
    }
    return orElse();
  }
}

abstract class _Data<L, E> implements Result<L, E> {
  const factory _Data(L value) = _$_Data<L, E>;

  L get value;
  @JsonKey(ignore: true)
  _$DataCopyWith<L, E, _Data<L, E>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<L, E, $Res> {
  factory _$ErrorCopyWith(
          _Error<L, E> value, $Res Function(_Error<L, E>) then) =
      __$ErrorCopyWithImpl<L, E, $Res>;
  $Res call({E value});
}

/// @nodoc
class __$ErrorCopyWithImpl<L, E, $Res> extends _$ResultCopyWithImpl<L, E, $Res>
    implements _$ErrorCopyWith<L, E, $Res> {
  __$ErrorCopyWithImpl(_Error<L, E> _value, $Res Function(_Error<L, E>) _then)
      : super(_value, (v) => _then(v as _Error<L, E>));

  @override
  _Error<L, E> get _value => super._value as _Error<L, E>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_Error<L, E>(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as E,
    ));
  }
}

/// @nodoc

class _$_Error<L, E> implements _Error<L, E> {
  const _$_Error(this.value);

  @override
  final E value;

  @override
  String toString() {
    return 'Result<$L, $E>.error(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error<L, E> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<L, E, _Error<L, E>> get copyWith =>
      __$ErrorCopyWithImpl<L, E, _Error<L, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(L value) value,
    required TResult Function(E value) error,
    required TResult Function() none,
  }) {
    return error(this.value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(L value)? value,
    TResult Function(E value)? error,
    TResult Function()? none,
  }) {
    return error?.call(this.value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(L value)? value,
    TResult Function(E value)? error,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data<L, E> value) value,
    required TResult Function(_Error<L, E> value) error,
    required TResult Function(_None<L, E> value) none,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data<L, E> value)? value,
    TResult Function(_Error<L, E> value)? error,
    TResult Function(_None<L, E> value)? none,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data<L, E> value)? value,
    TResult Function(_Error<L, E> value)? error,
    TResult Function(_None<L, E> value)? none,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error<L, E> implements Result<L, E> {
  const factory _Error(E value) = _$_Error<L, E>;

  E get value;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<L, E, _Error<L, E>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$NoneCopyWith<L, E, $Res> {
  factory _$NoneCopyWith(_None<L, E> value, $Res Function(_None<L, E>) then) =
      __$NoneCopyWithImpl<L, E, $Res>;
}

/// @nodoc
class __$NoneCopyWithImpl<L, E, $Res> extends _$ResultCopyWithImpl<L, E, $Res>
    implements _$NoneCopyWith<L, E, $Res> {
  __$NoneCopyWithImpl(_None<L, E> _value, $Res Function(_None<L, E>) _then)
      : super(_value, (v) => _then(v as _None<L, E>));

  @override
  _None<L, E> get _value => super._value as _None<L, E>;
}

/// @nodoc

class _$_None<L, E> implements _None<L, E> {
  const _$_None();

  @override
  String toString() {
    return 'Result<$L, $E>.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _None<L, E>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(L value) value,
    required TResult Function(E value) error,
    required TResult Function() none,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(L value)? value,
    TResult Function(E value)? error,
    TResult Function()? none,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(L value)? value,
    TResult Function(E value)? error,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data<L, E> value) value,
    required TResult Function(_Error<L, E> value) error,
    required TResult Function(_None<L, E> value) none,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Data<L, E> value)? value,
    TResult Function(_Error<L, E> value)? error,
    TResult Function(_None<L, E> value)? none,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data<L, E> value)? value,
    TResult Function(_Error<L, E> value)? error,
    TResult Function(_None<L, E> value)? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class _None<L, E> implements Result<L, E> {
  const factory _None() = _$_None<L, E>;
}
