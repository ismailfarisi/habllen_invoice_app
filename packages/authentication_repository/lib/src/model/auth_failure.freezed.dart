// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthFailureTearOff {
  const _$AuthFailureTearOff();

  CancelByUser cancelByUser() {
    return const CancelByUser();
  }

  ServerError serverError() {
    return const ServerError();
  }

  InvalidCredentialError invalidCredentialError() {
    return const InvalidCredentialError();
  }
}

/// @nodoc
const $AuthFailure = _$AuthFailureTearOff();

/// @nodoc
mixin _$AuthFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cancelByUser,
    required TResult Function() serverError,
    required TResult Function() invalidCredentialError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cancelByUser,
    TResult Function()? serverError,
    TResult Function()? invalidCredentialError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cancelByUser,
    TResult Function()? serverError,
    TResult Function()? invalidCredentialError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelByUser value) cancelByUser,
    required TResult Function(ServerError value) serverError,
    required TResult Function(InvalidCredentialError value)
        invalidCredentialError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CancelByUser value)? cancelByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(InvalidCredentialError value)? invalidCredentialError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelByUser value)? cancelByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(InvalidCredentialError value)? invalidCredentialError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res> implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  final AuthFailure _value;
  // ignore: unused_field
  final $Res Function(AuthFailure) _then;
}

/// @nodoc
abstract class $CancelByUserCopyWith<$Res> {
  factory $CancelByUserCopyWith(
          CancelByUser value, $Res Function(CancelByUser) then) =
      _$CancelByUserCopyWithImpl<$Res>;
}

/// @nodoc
class _$CancelByUserCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements $CancelByUserCopyWith<$Res> {
  _$CancelByUserCopyWithImpl(
      CancelByUser _value, $Res Function(CancelByUser) _then)
      : super(_value, (v) => _then(v as CancelByUser));

  @override
  CancelByUser get _value => super._value as CancelByUser;
}

/// @nodoc

class _$CancelByUser implements CancelByUser {
  const _$CancelByUser();

  @override
  String toString() {
    return 'AuthFailure.cancelByUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CancelByUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cancelByUser,
    required TResult Function() serverError,
    required TResult Function() invalidCredentialError,
  }) {
    return cancelByUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cancelByUser,
    TResult Function()? serverError,
    TResult Function()? invalidCredentialError,
  }) {
    return cancelByUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cancelByUser,
    TResult Function()? serverError,
    TResult Function()? invalidCredentialError,
    required TResult orElse(),
  }) {
    if (cancelByUser != null) {
      return cancelByUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelByUser value) cancelByUser,
    required TResult Function(ServerError value) serverError,
    required TResult Function(InvalidCredentialError value)
        invalidCredentialError,
  }) {
    return cancelByUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CancelByUser value)? cancelByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(InvalidCredentialError value)? invalidCredentialError,
  }) {
    return cancelByUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelByUser value)? cancelByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(InvalidCredentialError value)? invalidCredentialError,
    required TResult orElse(),
  }) {
    if (cancelByUser != null) {
      return cancelByUser(this);
    }
    return orElse();
  }
}

abstract class CancelByUser implements AuthFailure {
  const factory CancelByUser() = _$CancelByUser;
}

/// @nodoc
abstract class $ServerErrorCopyWith<$Res> {
  factory $ServerErrorCopyWith(
          ServerError value, $Res Function(ServerError) then) =
      _$ServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$ServerErrorCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(
      ServerError _value, $Res Function(ServerError) _then)
      : super(_value, (v) => _then(v as ServerError));

  @override
  ServerError get _value => super._value as ServerError;
}

/// @nodoc

class _$ServerError implements ServerError {
  const _$ServerError();

  @override
  String toString() {
    return 'AuthFailure.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cancelByUser,
    required TResult Function() serverError,
    required TResult Function() invalidCredentialError,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cancelByUser,
    TResult Function()? serverError,
    TResult Function()? invalidCredentialError,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cancelByUser,
    TResult Function()? serverError,
    TResult Function()? invalidCredentialError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelByUser value) cancelByUser,
    required TResult Function(ServerError value) serverError,
    required TResult Function(InvalidCredentialError value)
        invalidCredentialError,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CancelByUser value)? cancelByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(InvalidCredentialError value)? invalidCredentialError,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelByUser value)? cancelByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(InvalidCredentialError value)? invalidCredentialError,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements AuthFailure {
  const factory ServerError() = _$ServerError;
}

/// @nodoc
abstract class $InvalidCredentialErrorCopyWith<$Res> {
  factory $InvalidCredentialErrorCopyWith(InvalidCredentialError value,
          $Res Function(InvalidCredentialError) then) =
      _$InvalidCredentialErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$InvalidCredentialErrorCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements $InvalidCredentialErrorCopyWith<$Res> {
  _$InvalidCredentialErrorCopyWithImpl(InvalidCredentialError _value,
      $Res Function(InvalidCredentialError) _then)
      : super(_value, (v) => _then(v as InvalidCredentialError));

  @override
  InvalidCredentialError get _value => super._value as InvalidCredentialError;
}

/// @nodoc

class _$InvalidCredentialError implements InvalidCredentialError {
  const _$InvalidCredentialError();

  @override
  String toString() {
    return 'AuthFailure.invalidCredentialError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InvalidCredentialError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cancelByUser,
    required TResult Function() serverError,
    required TResult Function() invalidCredentialError,
  }) {
    return invalidCredentialError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cancelByUser,
    TResult Function()? serverError,
    TResult Function()? invalidCredentialError,
  }) {
    return invalidCredentialError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cancelByUser,
    TResult Function()? serverError,
    TResult Function()? invalidCredentialError,
    required TResult orElse(),
  }) {
    if (invalidCredentialError != null) {
      return invalidCredentialError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelByUser value) cancelByUser,
    required TResult Function(ServerError value) serverError,
    required TResult Function(InvalidCredentialError value)
        invalidCredentialError,
  }) {
    return invalidCredentialError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CancelByUser value)? cancelByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(InvalidCredentialError value)? invalidCredentialError,
  }) {
    return invalidCredentialError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelByUser value)? cancelByUser,
    TResult Function(ServerError value)? serverError,
    TResult Function(InvalidCredentialError value)? invalidCredentialError,
    required TResult orElse(),
  }) {
    if (invalidCredentialError != null) {
      return invalidCredentialError(this);
    }
    return orElse();
  }
}

abstract class InvalidCredentialError implements AuthFailure {
  const factory InvalidCredentialError() = _$InvalidCredentialError;
}
