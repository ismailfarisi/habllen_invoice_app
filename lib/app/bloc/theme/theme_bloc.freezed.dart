// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'theme_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ThemeEventTearOff {
  const _$ThemeEventTearOff();

  _ThemeChanged changed() {
    return const _ThemeChanged();
  }

  _AppStarted started() {
    return const _AppStarted();
  }
}

/// @nodoc
const $ThemeEvent = _$ThemeEventTearOff();

/// @nodoc
mixin _$ThemeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() changed,
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? changed,
    TResult Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? changed,
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ThemeChanged value) changed,
    required TResult Function(_AppStarted value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ThemeChanged value)? changed,
    TResult Function(_AppStarted value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ThemeChanged value)? changed,
    TResult Function(_AppStarted value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeEventCopyWith<$Res> {
  factory $ThemeEventCopyWith(
          ThemeEvent value, $Res Function(ThemeEvent) then) =
      _$ThemeEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ThemeEventCopyWithImpl<$Res> implements $ThemeEventCopyWith<$Res> {
  _$ThemeEventCopyWithImpl(this._value, this._then);

  final ThemeEvent _value;
  // ignore: unused_field
  final $Res Function(ThemeEvent) _then;
}

/// @nodoc
abstract class _$ThemeChangedCopyWith<$Res> {
  factory _$ThemeChangedCopyWith(
          _ThemeChanged value, $Res Function(_ThemeChanged) then) =
      __$ThemeChangedCopyWithImpl<$Res>;
}

/// @nodoc
class __$ThemeChangedCopyWithImpl<$Res> extends _$ThemeEventCopyWithImpl<$Res>
    implements _$ThemeChangedCopyWith<$Res> {
  __$ThemeChangedCopyWithImpl(
      _ThemeChanged _value, $Res Function(_ThemeChanged) _then)
      : super(_value, (v) => _then(v as _ThemeChanged));

  @override
  _ThemeChanged get _value => super._value as _ThemeChanged;
}

/// @nodoc

class _$_ThemeChanged implements _ThemeChanged {
  const _$_ThemeChanged();

  @override
  String toString() {
    return 'ThemeEvent.changed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ThemeChanged);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() changed,
    required TResult Function() started,
  }) {
    return changed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? changed,
    TResult Function()? started,
  }) {
    return changed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? changed,
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (changed != null) {
      return changed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ThemeChanged value) changed,
    required TResult Function(_AppStarted value) started,
  }) {
    return changed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ThemeChanged value)? changed,
    TResult Function(_AppStarted value)? started,
  }) {
    return changed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ThemeChanged value)? changed,
    TResult Function(_AppStarted value)? started,
    required TResult orElse(),
  }) {
    if (changed != null) {
      return changed(this);
    }
    return orElse();
  }
}

abstract class _ThemeChanged implements ThemeEvent {
  const factory _ThemeChanged() = _$_ThemeChanged;
}

/// @nodoc
abstract class _$AppStartedCopyWith<$Res> {
  factory _$AppStartedCopyWith(
          _AppStarted value, $Res Function(_AppStarted) then) =
      __$AppStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$AppStartedCopyWithImpl<$Res> extends _$ThemeEventCopyWithImpl<$Res>
    implements _$AppStartedCopyWith<$Res> {
  __$AppStartedCopyWithImpl(
      _AppStarted _value, $Res Function(_AppStarted) _then)
      : super(_value, (v) => _then(v as _AppStarted));

  @override
  _AppStarted get _value => super._value as _AppStarted;
}

/// @nodoc

class _$_AppStarted implements _AppStarted {
  const _$_AppStarted();

  @override
  String toString() {
    return 'ThemeEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _AppStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() changed,
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? changed,
    TResult Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? changed,
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ThemeChanged value) changed,
    required TResult Function(_AppStarted value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ThemeChanged value)? changed,
    TResult Function(_AppStarted value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ThemeChanged value)? changed,
    TResult Function(_AppStarted value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _AppStarted implements ThemeEvent {
  const factory _AppStarted() = _$_AppStarted;
}

/// @nodoc
class _$ThemeStateTearOff {
  const _$ThemeStateTearOff();

  _ThemeState call({ThemeMode themeMode = ThemeMode.light}) {
    return _ThemeState(
      themeMode: themeMode,
    );
  }
}

/// @nodoc
const $ThemeState = _$ThemeStateTearOff();

/// @nodoc
mixin _$ThemeState {
  ThemeMode get themeMode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeStateCopyWith<ThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
          ThemeState value, $Res Function(ThemeState) then) =
      _$ThemeStateCopyWithImpl<$Res>;
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class _$ThemeStateCopyWithImpl<$Res> implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

  final ThemeState _value;
  // ignore: unused_field
  final $Res Function(ThemeState) _then;

  @override
  $Res call({
    Object? themeMode = freezed,
  }) {
    return _then(_value.copyWith(
      themeMode: themeMode == freezed
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc
abstract class _$ThemeStateCopyWith<$Res> implements $ThemeStateCopyWith<$Res> {
  factory _$ThemeStateCopyWith(
          _ThemeState value, $Res Function(_ThemeState) then) =
      __$ThemeStateCopyWithImpl<$Res>;
  @override
  $Res call({ThemeMode themeMode});
}

/// @nodoc
class __$ThemeStateCopyWithImpl<$Res> extends _$ThemeStateCopyWithImpl<$Res>
    implements _$ThemeStateCopyWith<$Res> {
  __$ThemeStateCopyWithImpl(
      _ThemeState _value, $Res Function(_ThemeState) _then)
      : super(_value, (v) => _then(v as _ThemeState));

  @override
  _ThemeState get _value => super._value as _ThemeState;

  @override
  $Res call({
    Object? themeMode = freezed,
  }) {
    return _then(_ThemeState(
      themeMode: themeMode == freezed
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc

class _$_ThemeState implements _ThemeState {
  const _$_ThemeState({this.themeMode = ThemeMode.light});

  @JsonKey()
  @override
  final ThemeMode themeMode;

  @override
  String toString() {
    return 'ThemeState(themeMode: $themeMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ThemeState &&
            const DeepCollectionEquality().equals(other.themeMode, themeMode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(themeMode));

  @JsonKey(ignore: true)
  @override
  _$ThemeStateCopyWith<_ThemeState> get copyWith =>
      __$ThemeStateCopyWithImpl<_ThemeState>(this, _$identity);
}

abstract class _ThemeState implements ThemeState {
  const factory _ThemeState({ThemeMode themeMode}) = _$_ThemeState;

  @override
  ThemeMode get themeMode;
  @override
  @JsonKey(ignore: true)
  _$ThemeStateCopyWith<_ThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}
