// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'company_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CompanyProfileEventTearOff {
  const _$CompanyProfileEventTearOff();

  CompanyNameChanged companyNameChanged(String name) {
    return CompanyNameChanged(
      name,
    );
  }

  CompanyAddress1Changed companyAddress1Changed(String address) {
    return CompanyAddress1Changed(
      address,
    );
  }

  CompanyAddress2Changed companyAddress2Changed(String address) {
    return CompanyAddress2Changed(
      address,
    );
  }

  PhoneChanged companyPhoneChanged(String phone) {
    return PhoneChanged(
      phone,
    );
  }

  EmailChanged companyEmailChanged(String email) {
    return EmailChanged(
      email,
    );
  }

  OnSaved onSaved() {
    return const OnSaved();
  }
}

/// @nodoc
const $CompanyProfileEvent = _$CompanyProfileEventTearOff();

/// @nodoc
mixin _$CompanyProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) companyNameChanged,
    required TResult Function(String address) companyAddress1Changed,
    required TResult Function(String address) companyAddress2Changed,
    required TResult Function(String phone) companyPhoneChanged,
    required TResult Function(String email) companyEmailChanged,
    required TResult Function() onSaved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name)? companyNameChanged,
    TResult Function(String address)? companyAddress1Changed,
    TResult Function(String address)? companyAddress2Changed,
    TResult Function(String phone)? companyPhoneChanged,
    TResult Function(String email)? companyEmailChanged,
    TResult Function()? onSaved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? companyNameChanged,
    TResult Function(String address)? companyAddress1Changed,
    TResult Function(String address)? companyAddress2Changed,
    TResult Function(String phone)? companyPhoneChanged,
    TResult Function(String email)? companyEmailChanged,
    TResult Function()? onSaved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CompanyNameChanged value) companyNameChanged,
    required TResult Function(CompanyAddress1Changed value)
        companyAddress1Changed,
    required TResult Function(CompanyAddress2Changed value)
        companyAddress2Changed,
    required TResult Function(PhoneChanged value) companyPhoneChanged,
    required TResult Function(EmailChanged value) companyEmailChanged,
    required TResult Function(OnSaved value) onSaved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CompanyNameChanged value)? companyNameChanged,
    TResult Function(CompanyAddress1Changed value)? companyAddress1Changed,
    TResult Function(CompanyAddress2Changed value)? companyAddress2Changed,
    TResult Function(PhoneChanged value)? companyPhoneChanged,
    TResult Function(EmailChanged value)? companyEmailChanged,
    TResult Function(OnSaved value)? onSaved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompanyNameChanged value)? companyNameChanged,
    TResult Function(CompanyAddress1Changed value)? companyAddress1Changed,
    TResult Function(CompanyAddress2Changed value)? companyAddress2Changed,
    TResult Function(PhoneChanged value)? companyPhoneChanged,
    TResult Function(EmailChanged value)? companyEmailChanged,
    TResult Function(OnSaved value)? onSaved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyProfileEventCopyWith<$Res> {
  factory $CompanyProfileEventCopyWith(
          CompanyProfileEvent value, $Res Function(CompanyProfileEvent) then) =
      _$CompanyProfileEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CompanyProfileEventCopyWithImpl<$Res>
    implements $CompanyProfileEventCopyWith<$Res> {
  _$CompanyProfileEventCopyWithImpl(this._value, this._then);

  final CompanyProfileEvent _value;
  // ignore: unused_field
  final $Res Function(CompanyProfileEvent) _then;
}

/// @nodoc
abstract class $CompanyNameChangedCopyWith<$Res> {
  factory $CompanyNameChangedCopyWith(
          CompanyNameChanged value, $Res Function(CompanyNameChanged) then) =
      _$CompanyNameChangedCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$CompanyNameChangedCopyWithImpl<$Res>
    extends _$CompanyProfileEventCopyWithImpl<$Res>
    implements $CompanyNameChangedCopyWith<$Res> {
  _$CompanyNameChangedCopyWithImpl(
      CompanyNameChanged _value, $Res Function(CompanyNameChanged) _then)
      : super(_value, (v) => _then(v as CompanyNameChanged));

  @override
  CompanyNameChanged get _value => super._value as CompanyNameChanged;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(CompanyNameChanged(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CompanyNameChanged implements CompanyNameChanged {
  const _$CompanyNameChanged(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'CompanyProfileEvent.companyNameChanged(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CompanyNameChanged &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  $CompanyNameChangedCopyWith<CompanyNameChanged> get copyWith =>
      _$CompanyNameChangedCopyWithImpl<CompanyNameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) companyNameChanged,
    required TResult Function(String address) companyAddress1Changed,
    required TResult Function(String address) companyAddress2Changed,
    required TResult Function(String phone) companyPhoneChanged,
    required TResult Function(String email) companyEmailChanged,
    required TResult Function() onSaved,
  }) {
    return companyNameChanged(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name)? companyNameChanged,
    TResult Function(String address)? companyAddress1Changed,
    TResult Function(String address)? companyAddress2Changed,
    TResult Function(String phone)? companyPhoneChanged,
    TResult Function(String email)? companyEmailChanged,
    TResult Function()? onSaved,
  }) {
    return companyNameChanged?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? companyNameChanged,
    TResult Function(String address)? companyAddress1Changed,
    TResult Function(String address)? companyAddress2Changed,
    TResult Function(String phone)? companyPhoneChanged,
    TResult Function(String email)? companyEmailChanged,
    TResult Function()? onSaved,
    required TResult orElse(),
  }) {
    if (companyNameChanged != null) {
      return companyNameChanged(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CompanyNameChanged value) companyNameChanged,
    required TResult Function(CompanyAddress1Changed value)
        companyAddress1Changed,
    required TResult Function(CompanyAddress2Changed value)
        companyAddress2Changed,
    required TResult Function(PhoneChanged value) companyPhoneChanged,
    required TResult Function(EmailChanged value) companyEmailChanged,
    required TResult Function(OnSaved value) onSaved,
  }) {
    return companyNameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CompanyNameChanged value)? companyNameChanged,
    TResult Function(CompanyAddress1Changed value)? companyAddress1Changed,
    TResult Function(CompanyAddress2Changed value)? companyAddress2Changed,
    TResult Function(PhoneChanged value)? companyPhoneChanged,
    TResult Function(EmailChanged value)? companyEmailChanged,
    TResult Function(OnSaved value)? onSaved,
  }) {
    return companyNameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompanyNameChanged value)? companyNameChanged,
    TResult Function(CompanyAddress1Changed value)? companyAddress1Changed,
    TResult Function(CompanyAddress2Changed value)? companyAddress2Changed,
    TResult Function(PhoneChanged value)? companyPhoneChanged,
    TResult Function(EmailChanged value)? companyEmailChanged,
    TResult Function(OnSaved value)? onSaved,
    required TResult orElse(),
  }) {
    if (companyNameChanged != null) {
      return companyNameChanged(this);
    }
    return orElse();
  }
}

abstract class CompanyNameChanged implements CompanyProfileEvent {
  const factory CompanyNameChanged(String name) = _$CompanyNameChanged;

  String get name;
  @JsonKey(ignore: true)
  $CompanyNameChangedCopyWith<CompanyNameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyAddress1ChangedCopyWith<$Res> {
  factory $CompanyAddress1ChangedCopyWith(CompanyAddress1Changed value,
          $Res Function(CompanyAddress1Changed) then) =
      _$CompanyAddress1ChangedCopyWithImpl<$Res>;
  $Res call({String address});
}

/// @nodoc
class _$CompanyAddress1ChangedCopyWithImpl<$Res>
    extends _$CompanyProfileEventCopyWithImpl<$Res>
    implements $CompanyAddress1ChangedCopyWith<$Res> {
  _$CompanyAddress1ChangedCopyWithImpl(CompanyAddress1Changed _value,
      $Res Function(CompanyAddress1Changed) _then)
      : super(_value, (v) => _then(v as CompanyAddress1Changed));

  @override
  CompanyAddress1Changed get _value => super._value as CompanyAddress1Changed;

  @override
  $Res call({
    Object? address = freezed,
  }) {
    return _then(CompanyAddress1Changed(
      address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CompanyAddress1Changed implements CompanyAddress1Changed {
  const _$CompanyAddress1Changed(this.address);

  @override
  final String address;

  @override
  String toString() {
    return 'CompanyProfileEvent.companyAddress1Changed(address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CompanyAddress1Changed &&
            const DeepCollectionEquality().equals(other.address, address));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(address));

  @JsonKey(ignore: true)
  @override
  $CompanyAddress1ChangedCopyWith<CompanyAddress1Changed> get copyWith =>
      _$CompanyAddress1ChangedCopyWithImpl<CompanyAddress1Changed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) companyNameChanged,
    required TResult Function(String address) companyAddress1Changed,
    required TResult Function(String address) companyAddress2Changed,
    required TResult Function(String phone) companyPhoneChanged,
    required TResult Function(String email) companyEmailChanged,
    required TResult Function() onSaved,
  }) {
    return companyAddress1Changed(address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name)? companyNameChanged,
    TResult Function(String address)? companyAddress1Changed,
    TResult Function(String address)? companyAddress2Changed,
    TResult Function(String phone)? companyPhoneChanged,
    TResult Function(String email)? companyEmailChanged,
    TResult Function()? onSaved,
  }) {
    return companyAddress1Changed?.call(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? companyNameChanged,
    TResult Function(String address)? companyAddress1Changed,
    TResult Function(String address)? companyAddress2Changed,
    TResult Function(String phone)? companyPhoneChanged,
    TResult Function(String email)? companyEmailChanged,
    TResult Function()? onSaved,
    required TResult orElse(),
  }) {
    if (companyAddress1Changed != null) {
      return companyAddress1Changed(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CompanyNameChanged value) companyNameChanged,
    required TResult Function(CompanyAddress1Changed value)
        companyAddress1Changed,
    required TResult Function(CompanyAddress2Changed value)
        companyAddress2Changed,
    required TResult Function(PhoneChanged value) companyPhoneChanged,
    required TResult Function(EmailChanged value) companyEmailChanged,
    required TResult Function(OnSaved value) onSaved,
  }) {
    return companyAddress1Changed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CompanyNameChanged value)? companyNameChanged,
    TResult Function(CompanyAddress1Changed value)? companyAddress1Changed,
    TResult Function(CompanyAddress2Changed value)? companyAddress2Changed,
    TResult Function(PhoneChanged value)? companyPhoneChanged,
    TResult Function(EmailChanged value)? companyEmailChanged,
    TResult Function(OnSaved value)? onSaved,
  }) {
    return companyAddress1Changed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompanyNameChanged value)? companyNameChanged,
    TResult Function(CompanyAddress1Changed value)? companyAddress1Changed,
    TResult Function(CompanyAddress2Changed value)? companyAddress2Changed,
    TResult Function(PhoneChanged value)? companyPhoneChanged,
    TResult Function(EmailChanged value)? companyEmailChanged,
    TResult Function(OnSaved value)? onSaved,
    required TResult orElse(),
  }) {
    if (companyAddress1Changed != null) {
      return companyAddress1Changed(this);
    }
    return orElse();
  }
}

abstract class CompanyAddress1Changed implements CompanyProfileEvent {
  const factory CompanyAddress1Changed(String address) =
      _$CompanyAddress1Changed;

  String get address;
  @JsonKey(ignore: true)
  $CompanyAddress1ChangedCopyWith<CompanyAddress1Changed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyAddress2ChangedCopyWith<$Res> {
  factory $CompanyAddress2ChangedCopyWith(CompanyAddress2Changed value,
          $Res Function(CompanyAddress2Changed) then) =
      _$CompanyAddress2ChangedCopyWithImpl<$Res>;
  $Res call({String address});
}

/// @nodoc
class _$CompanyAddress2ChangedCopyWithImpl<$Res>
    extends _$CompanyProfileEventCopyWithImpl<$Res>
    implements $CompanyAddress2ChangedCopyWith<$Res> {
  _$CompanyAddress2ChangedCopyWithImpl(CompanyAddress2Changed _value,
      $Res Function(CompanyAddress2Changed) _then)
      : super(_value, (v) => _then(v as CompanyAddress2Changed));

  @override
  CompanyAddress2Changed get _value => super._value as CompanyAddress2Changed;

  @override
  $Res call({
    Object? address = freezed,
  }) {
    return _then(CompanyAddress2Changed(
      address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CompanyAddress2Changed implements CompanyAddress2Changed {
  const _$CompanyAddress2Changed(this.address);

  @override
  final String address;

  @override
  String toString() {
    return 'CompanyProfileEvent.companyAddress2Changed(address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CompanyAddress2Changed &&
            const DeepCollectionEquality().equals(other.address, address));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(address));

  @JsonKey(ignore: true)
  @override
  $CompanyAddress2ChangedCopyWith<CompanyAddress2Changed> get copyWith =>
      _$CompanyAddress2ChangedCopyWithImpl<CompanyAddress2Changed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) companyNameChanged,
    required TResult Function(String address) companyAddress1Changed,
    required TResult Function(String address) companyAddress2Changed,
    required TResult Function(String phone) companyPhoneChanged,
    required TResult Function(String email) companyEmailChanged,
    required TResult Function() onSaved,
  }) {
    return companyAddress2Changed(address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name)? companyNameChanged,
    TResult Function(String address)? companyAddress1Changed,
    TResult Function(String address)? companyAddress2Changed,
    TResult Function(String phone)? companyPhoneChanged,
    TResult Function(String email)? companyEmailChanged,
    TResult Function()? onSaved,
  }) {
    return companyAddress2Changed?.call(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? companyNameChanged,
    TResult Function(String address)? companyAddress1Changed,
    TResult Function(String address)? companyAddress2Changed,
    TResult Function(String phone)? companyPhoneChanged,
    TResult Function(String email)? companyEmailChanged,
    TResult Function()? onSaved,
    required TResult orElse(),
  }) {
    if (companyAddress2Changed != null) {
      return companyAddress2Changed(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CompanyNameChanged value) companyNameChanged,
    required TResult Function(CompanyAddress1Changed value)
        companyAddress1Changed,
    required TResult Function(CompanyAddress2Changed value)
        companyAddress2Changed,
    required TResult Function(PhoneChanged value) companyPhoneChanged,
    required TResult Function(EmailChanged value) companyEmailChanged,
    required TResult Function(OnSaved value) onSaved,
  }) {
    return companyAddress2Changed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CompanyNameChanged value)? companyNameChanged,
    TResult Function(CompanyAddress1Changed value)? companyAddress1Changed,
    TResult Function(CompanyAddress2Changed value)? companyAddress2Changed,
    TResult Function(PhoneChanged value)? companyPhoneChanged,
    TResult Function(EmailChanged value)? companyEmailChanged,
    TResult Function(OnSaved value)? onSaved,
  }) {
    return companyAddress2Changed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompanyNameChanged value)? companyNameChanged,
    TResult Function(CompanyAddress1Changed value)? companyAddress1Changed,
    TResult Function(CompanyAddress2Changed value)? companyAddress2Changed,
    TResult Function(PhoneChanged value)? companyPhoneChanged,
    TResult Function(EmailChanged value)? companyEmailChanged,
    TResult Function(OnSaved value)? onSaved,
    required TResult orElse(),
  }) {
    if (companyAddress2Changed != null) {
      return companyAddress2Changed(this);
    }
    return orElse();
  }
}

abstract class CompanyAddress2Changed implements CompanyProfileEvent {
  const factory CompanyAddress2Changed(String address) =
      _$CompanyAddress2Changed;

  String get address;
  @JsonKey(ignore: true)
  $CompanyAddress2ChangedCopyWith<CompanyAddress2Changed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneChangedCopyWith<$Res> {
  factory $PhoneChangedCopyWith(
          PhoneChanged value, $Res Function(PhoneChanged) then) =
      _$PhoneChangedCopyWithImpl<$Res>;
  $Res call({String phone});
}

/// @nodoc
class _$PhoneChangedCopyWithImpl<$Res>
    extends _$CompanyProfileEventCopyWithImpl<$Res>
    implements $PhoneChangedCopyWith<$Res> {
  _$PhoneChangedCopyWithImpl(
      PhoneChanged _value, $Res Function(PhoneChanged) _then)
      : super(_value, (v) => _then(v as PhoneChanged));

  @override
  PhoneChanged get _value => super._value as PhoneChanged;

  @override
  $Res call({
    Object? phone = freezed,
  }) {
    return _then(PhoneChanged(
      phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhoneChanged implements PhoneChanged {
  const _$PhoneChanged(this.phone);

  @override
  final String phone;

  @override
  String toString() {
    return 'CompanyProfileEvent.companyPhoneChanged(phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PhoneChanged &&
            const DeepCollectionEquality().equals(other.phone, phone));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(phone));

  @JsonKey(ignore: true)
  @override
  $PhoneChangedCopyWith<PhoneChanged> get copyWith =>
      _$PhoneChangedCopyWithImpl<PhoneChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) companyNameChanged,
    required TResult Function(String address) companyAddress1Changed,
    required TResult Function(String address) companyAddress2Changed,
    required TResult Function(String phone) companyPhoneChanged,
    required TResult Function(String email) companyEmailChanged,
    required TResult Function() onSaved,
  }) {
    return companyPhoneChanged(phone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name)? companyNameChanged,
    TResult Function(String address)? companyAddress1Changed,
    TResult Function(String address)? companyAddress2Changed,
    TResult Function(String phone)? companyPhoneChanged,
    TResult Function(String email)? companyEmailChanged,
    TResult Function()? onSaved,
  }) {
    return companyPhoneChanged?.call(phone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? companyNameChanged,
    TResult Function(String address)? companyAddress1Changed,
    TResult Function(String address)? companyAddress2Changed,
    TResult Function(String phone)? companyPhoneChanged,
    TResult Function(String email)? companyEmailChanged,
    TResult Function()? onSaved,
    required TResult orElse(),
  }) {
    if (companyPhoneChanged != null) {
      return companyPhoneChanged(phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CompanyNameChanged value) companyNameChanged,
    required TResult Function(CompanyAddress1Changed value)
        companyAddress1Changed,
    required TResult Function(CompanyAddress2Changed value)
        companyAddress2Changed,
    required TResult Function(PhoneChanged value) companyPhoneChanged,
    required TResult Function(EmailChanged value) companyEmailChanged,
    required TResult Function(OnSaved value) onSaved,
  }) {
    return companyPhoneChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CompanyNameChanged value)? companyNameChanged,
    TResult Function(CompanyAddress1Changed value)? companyAddress1Changed,
    TResult Function(CompanyAddress2Changed value)? companyAddress2Changed,
    TResult Function(PhoneChanged value)? companyPhoneChanged,
    TResult Function(EmailChanged value)? companyEmailChanged,
    TResult Function(OnSaved value)? onSaved,
  }) {
    return companyPhoneChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompanyNameChanged value)? companyNameChanged,
    TResult Function(CompanyAddress1Changed value)? companyAddress1Changed,
    TResult Function(CompanyAddress2Changed value)? companyAddress2Changed,
    TResult Function(PhoneChanged value)? companyPhoneChanged,
    TResult Function(EmailChanged value)? companyEmailChanged,
    TResult Function(OnSaved value)? onSaved,
    required TResult orElse(),
  }) {
    if (companyPhoneChanged != null) {
      return companyPhoneChanged(this);
    }
    return orElse();
  }
}

abstract class PhoneChanged implements CompanyProfileEvent {
  const factory PhoneChanged(String phone) = _$PhoneChanged;

  String get phone;
  @JsonKey(ignore: true)
  $PhoneChangedCopyWith<PhoneChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailChangedCopyWith<$Res> {
  factory $EmailChangedCopyWith(
          EmailChanged value, $Res Function(EmailChanged) then) =
      _$EmailChangedCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class _$EmailChangedCopyWithImpl<$Res>
    extends _$CompanyProfileEventCopyWithImpl<$Res>
    implements $EmailChangedCopyWith<$Res> {
  _$EmailChangedCopyWithImpl(
      EmailChanged _value, $Res Function(EmailChanged) _then)
      : super(_value, (v) => _then(v as EmailChanged));

  @override
  EmailChanged get _value => super._value as EmailChanged;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(EmailChanged(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailChanged implements EmailChanged {
  const _$EmailChanged(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'CompanyProfileEvent.companyEmailChanged(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmailChanged &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  $EmailChangedCopyWith<EmailChanged> get copyWith =>
      _$EmailChangedCopyWithImpl<EmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) companyNameChanged,
    required TResult Function(String address) companyAddress1Changed,
    required TResult Function(String address) companyAddress2Changed,
    required TResult Function(String phone) companyPhoneChanged,
    required TResult Function(String email) companyEmailChanged,
    required TResult Function() onSaved,
  }) {
    return companyEmailChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name)? companyNameChanged,
    TResult Function(String address)? companyAddress1Changed,
    TResult Function(String address)? companyAddress2Changed,
    TResult Function(String phone)? companyPhoneChanged,
    TResult Function(String email)? companyEmailChanged,
    TResult Function()? onSaved,
  }) {
    return companyEmailChanged?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? companyNameChanged,
    TResult Function(String address)? companyAddress1Changed,
    TResult Function(String address)? companyAddress2Changed,
    TResult Function(String phone)? companyPhoneChanged,
    TResult Function(String email)? companyEmailChanged,
    TResult Function()? onSaved,
    required TResult orElse(),
  }) {
    if (companyEmailChanged != null) {
      return companyEmailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CompanyNameChanged value) companyNameChanged,
    required TResult Function(CompanyAddress1Changed value)
        companyAddress1Changed,
    required TResult Function(CompanyAddress2Changed value)
        companyAddress2Changed,
    required TResult Function(PhoneChanged value) companyPhoneChanged,
    required TResult Function(EmailChanged value) companyEmailChanged,
    required TResult Function(OnSaved value) onSaved,
  }) {
    return companyEmailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CompanyNameChanged value)? companyNameChanged,
    TResult Function(CompanyAddress1Changed value)? companyAddress1Changed,
    TResult Function(CompanyAddress2Changed value)? companyAddress2Changed,
    TResult Function(PhoneChanged value)? companyPhoneChanged,
    TResult Function(EmailChanged value)? companyEmailChanged,
    TResult Function(OnSaved value)? onSaved,
  }) {
    return companyEmailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompanyNameChanged value)? companyNameChanged,
    TResult Function(CompanyAddress1Changed value)? companyAddress1Changed,
    TResult Function(CompanyAddress2Changed value)? companyAddress2Changed,
    TResult Function(PhoneChanged value)? companyPhoneChanged,
    TResult Function(EmailChanged value)? companyEmailChanged,
    TResult Function(OnSaved value)? onSaved,
    required TResult orElse(),
  }) {
    if (companyEmailChanged != null) {
      return companyEmailChanged(this);
    }
    return orElse();
  }
}

abstract class EmailChanged implements CompanyProfileEvent {
  const factory EmailChanged(String email) = _$EmailChanged;

  String get email;
  @JsonKey(ignore: true)
  $EmailChangedCopyWith<EmailChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnSavedCopyWith<$Res> {
  factory $OnSavedCopyWith(OnSaved value, $Res Function(OnSaved) then) =
      _$OnSavedCopyWithImpl<$Res>;
}

/// @nodoc
class _$OnSavedCopyWithImpl<$Res>
    extends _$CompanyProfileEventCopyWithImpl<$Res>
    implements $OnSavedCopyWith<$Res> {
  _$OnSavedCopyWithImpl(OnSaved _value, $Res Function(OnSaved) _then)
      : super(_value, (v) => _then(v as OnSaved));

  @override
  OnSaved get _value => super._value as OnSaved;
}

/// @nodoc

class _$OnSaved implements OnSaved {
  const _$OnSaved();

  @override
  String toString() {
    return 'CompanyProfileEvent.onSaved()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OnSaved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name) companyNameChanged,
    required TResult Function(String address) companyAddress1Changed,
    required TResult Function(String address) companyAddress2Changed,
    required TResult Function(String phone) companyPhoneChanged,
    required TResult Function(String email) companyEmailChanged,
    required TResult Function() onSaved,
  }) {
    return onSaved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String name)? companyNameChanged,
    TResult Function(String address)? companyAddress1Changed,
    TResult Function(String address)? companyAddress2Changed,
    TResult Function(String phone)? companyPhoneChanged,
    TResult Function(String email)? companyEmailChanged,
    TResult Function()? onSaved,
  }) {
    return onSaved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name)? companyNameChanged,
    TResult Function(String address)? companyAddress1Changed,
    TResult Function(String address)? companyAddress2Changed,
    TResult Function(String phone)? companyPhoneChanged,
    TResult Function(String email)? companyEmailChanged,
    TResult Function()? onSaved,
    required TResult orElse(),
  }) {
    if (onSaved != null) {
      return onSaved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CompanyNameChanged value) companyNameChanged,
    required TResult Function(CompanyAddress1Changed value)
        companyAddress1Changed,
    required TResult Function(CompanyAddress2Changed value)
        companyAddress2Changed,
    required TResult Function(PhoneChanged value) companyPhoneChanged,
    required TResult Function(EmailChanged value) companyEmailChanged,
    required TResult Function(OnSaved value) onSaved,
  }) {
    return onSaved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CompanyNameChanged value)? companyNameChanged,
    TResult Function(CompanyAddress1Changed value)? companyAddress1Changed,
    TResult Function(CompanyAddress2Changed value)? companyAddress2Changed,
    TResult Function(PhoneChanged value)? companyPhoneChanged,
    TResult Function(EmailChanged value)? companyEmailChanged,
    TResult Function(OnSaved value)? onSaved,
  }) {
    return onSaved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompanyNameChanged value)? companyNameChanged,
    TResult Function(CompanyAddress1Changed value)? companyAddress1Changed,
    TResult Function(CompanyAddress2Changed value)? companyAddress2Changed,
    TResult Function(PhoneChanged value)? companyPhoneChanged,
    TResult Function(EmailChanged value)? companyEmailChanged,
    TResult Function(OnSaved value)? onSaved,
    required TResult orElse(),
  }) {
    if (onSaved != null) {
      return onSaved(this);
    }
    return orElse();
  }
}

abstract class OnSaved implements CompanyProfileEvent {
  const factory OnSaved() = _$OnSaved;
}

/// @nodoc
class _$CompanyProfileStateTearOff {
  const _$CompanyProfileStateTearOff();

  _CompanyProfileState call(
      {InputString companyName = const InputString.pure(),
      InputString companyAddress1 = const InputString.pure(),
      InputString companyAddress2 = const InputString.pure(),
      InputGst gst = const InputGst.pure(),
      InputString companyPhone = const InputString.pure(),
      InputString companyEmail = const InputString.pure()}) {
    return _CompanyProfileState(
      companyName: companyName,
      companyAddress1: companyAddress1,
      companyAddress2: companyAddress2,
      gst: gst,
      companyPhone: companyPhone,
      companyEmail: companyEmail,
    );
  }
}

/// @nodoc
const $CompanyProfileState = _$CompanyProfileStateTearOff();

/// @nodoc
mixin _$CompanyProfileState {
  InputString get companyName => throw _privateConstructorUsedError;
  InputString get companyAddress1 => throw _privateConstructorUsedError;
  InputString get companyAddress2 => throw _privateConstructorUsedError;
  InputGst get gst => throw _privateConstructorUsedError;
  InputString get companyPhone => throw _privateConstructorUsedError;
  InputString get companyEmail => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CompanyProfileStateCopyWith<CompanyProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyProfileStateCopyWith<$Res> {
  factory $CompanyProfileStateCopyWith(
          CompanyProfileState value, $Res Function(CompanyProfileState) then) =
      _$CompanyProfileStateCopyWithImpl<$Res>;
  $Res call(
      {InputString companyName,
      InputString companyAddress1,
      InputString companyAddress2,
      InputGst gst,
      InputString companyPhone,
      InputString companyEmail});
}

/// @nodoc
class _$CompanyProfileStateCopyWithImpl<$Res>
    implements $CompanyProfileStateCopyWith<$Res> {
  _$CompanyProfileStateCopyWithImpl(this._value, this._then);

  final CompanyProfileState _value;
  // ignore: unused_field
  final $Res Function(CompanyProfileState) _then;

  @override
  $Res call({
    Object? companyName = freezed,
    Object? companyAddress1 = freezed,
    Object? companyAddress2 = freezed,
    Object? gst = freezed,
    Object? companyPhone = freezed,
    Object? companyEmail = freezed,
  }) {
    return _then(_value.copyWith(
      companyName: companyName == freezed
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as InputString,
      companyAddress1: companyAddress1 == freezed
          ? _value.companyAddress1
          : companyAddress1 // ignore: cast_nullable_to_non_nullable
              as InputString,
      companyAddress2: companyAddress2 == freezed
          ? _value.companyAddress2
          : companyAddress2 // ignore: cast_nullable_to_non_nullable
              as InputString,
      gst: gst == freezed
          ? _value.gst
          : gst // ignore: cast_nullable_to_non_nullable
              as InputGst,
      companyPhone: companyPhone == freezed
          ? _value.companyPhone
          : companyPhone // ignore: cast_nullable_to_non_nullable
              as InputString,
      companyEmail: companyEmail == freezed
          ? _value.companyEmail
          : companyEmail // ignore: cast_nullable_to_non_nullable
              as InputString,
    ));
  }
}

/// @nodoc
abstract class _$CompanyProfileStateCopyWith<$Res>
    implements $CompanyProfileStateCopyWith<$Res> {
  factory _$CompanyProfileStateCopyWith(_CompanyProfileState value,
          $Res Function(_CompanyProfileState) then) =
      __$CompanyProfileStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {InputString companyName,
      InputString companyAddress1,
      InputString companyAddress2,
      InputGst gst,
      InputString companyPhone,
      InputString companyEmail});
}

/// @nodoc
class __$CompanyProfileStateCopyWithImpl<$Res>
    extends _$CompanyProfileStateCopyWithImpl<$Res>
    implements _$CompanyProfileStateCopyWith<$Res> {
  __$CompanyProfileStateCopyWithImpl(
      _CompanyProfileState _value, $Res Function(_CompanyProfileState) _then)
      : super(_value, (v) => _then(v as _CompanyProfileState));

  @override
  _CompanyProfileState get _value => super._value as _CompanyProfileState;

  @override
  $Res call({
    Object? companyName = freezed,
    Object? companyAddress1 = freezed,
    Object? companyAddress2 = freezed,
    Object? gst = freezed,
    Object? companyPhone = freezed,
    Object? companyEmail = freezed,
  }) {
    return _then(_CompanyProfileState(
      companyName: companyName == freezed
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as InputString,
      companyAddress1: companyAddress1 == freezed
          ? _value.companyAddress1
          : companyAddress1 // ignore: cast_nullable_to_non_nullable
              as InputString,
      companyAddress2: companyAddress2 == freezed
          ? _value.companyAddress2
          : companyAddress2 // ignore: cast_nullable_to_non_nullable
              as InputString,
      gst: gst == freezed
          ? _value.gst
          : gst // ignore: cast_nullable_to_non_nullable
              as InputGst,
      companyPhone: companyPhone == freezed
          ? _value.companyPhone
          : companyPhone // ignore: cast_nullable_to_non_nullable
              as InputString,
      companyEmail: companyEmail == freezed
          ? _value.companyEmail
          : companyEmail // ignore: cast_nullable_to_non_nullable
              as InputString,
    ));
  }
}

/// @nodoc

class _$_CompanyProfileState implements _CompanyProfileState {
  const _$_CompanyProfileState(
      {this.companyName = const InputString.pure(),
      this.companyAddress1 = const InputString.pure(),
      this.companyAddress2 = const InputString.pure(),
      this.gst = const InputGst.pure(),
      this.companyPhone = const InputString.pure(),
      this.companyEmail = const InputString.pure()});

  @JsonKey()
  @override
  final InputString companyName;
  @JsonKey()
  @override
  final InputString companyAddress1;
  @JsonKey()
  @override
  final InputString companyAddress2;
  @JsonKey()
  @override
  final InputGst gst;
  @JsonKey()
  @override
  final InputString companyPhone;
  @JsonKey()
  @override
  final InputString companyEmail;

  @override
  String toString() {
    return 'CompanyProfileState(companyName: $companyName, companyAddress1: $companyAddress1, companyAddress2: $companyAddress2, gst: $gst, companyPhone: $companyPhone, companyEmail: $companyEmail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CompanyProfileState &&
            const DeepCollectionEquality()
                .equals(other.companyName, companyName) &&
            const DeepCollectionEquality()
                .equals(other.companyAddress1, companyAddress1) &&
            const DeepCollectionEquality()
                .equals(other.companyAddress2, companyAddress2) &&
            const DeepCollectionEquality().equals(other.gst, gst) &&
            const DeepCollectionEquality()
                .equals(other.companyPhone, companyPhone) &&
            const DeepCollectionEquality()
                .equals(other.companyEmail, companyEmail));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(companyName),
      const DeepCollectionEquality().hash(companyAddress1),
      const DeepCollectionEquality().hash(companyAddress2),
      const DeepCollectionEquality().hash(gst),
      const DeepCollectionEquality().hash(companyPhone),
      const DeepCollectionEquality().hash(companyEmail));

  @JsonKey(ignore: true)
  @override
  _$CompanyProfileStateCopyWith<_CompanyProfileState> get copyWith =>
      __$CompanyProfileStateCopyWithImpl<_CompanyProfileState>(
          this, _$identity);
}

abstract class _CompanyProfileState implements CompanyProfileState {
  const factory _CompanyProfileState(
      {InputString companyName,
      InputString companyAddress1,
      InputString companyAddress2,
      InputGst gst,
      InputString companyPhone,
      InputString companyEmail}) = _$_CompanyProfileState;

  @override
  InputString get companyName;
  @override
  InputString get companyAddress1;
  @override
  InputString get companyAddress2;
  @override
  InputGst get gst;
  @override
  InputString get companyPhone;
  @override
  InputString get companyEmail;
  @override
  @JsonKey(ignore: true)
  _$CompanyProfileStateCopyWith<_CompanyProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
