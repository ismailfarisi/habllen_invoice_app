// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return _Payment.fromJson(json);
}

/// @nodoc
class _$PaymentTearOff {
  const _$PaymentTearOff();

  _Payment call(
      {String? id,
      required String companyId,
      required double amount,
      required DateTime date,
      String? remarks}) {
    return _Payment(
      id: id,
      companyId: companyId,
      amount: amount,
      date: date,
      remarks: remarks,
    );
  }

  Payment fromJson(Map<String, Object?> json) {
    return Payment.fromJson(json);
  }
}

/// @nodoc
const $Payment = _$PaymentTearOff();

/// @nodoc
mixin _$Payment {
  String? get id => throw _privateConstructorUsedError;
  String get companyId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String? get remarks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentCopyWith<Payment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCopyWith<$Res> {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) then) =
      _$PaymentCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String companyId,
      double amount,
      DateTime date,
      String? remarks});
}

/// @nodoc
class _$PaymentCopyWithImpl<$Res> implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._value, this._then);

  final Payment _value;
  // ignore: unused_field
  final $Res Function(Payment) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? companyId = freezed,
    Object? amount = freezed,
    Object? date = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      companyId: companyId == freezed
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      remarks: remarks == freezed
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PaymentCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$PaymentCopyWith(_Payment value, $Res Function(_Payment) then) =
      __$PaymentCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String companyId,
      double amount,
      DateTime date,
      String? remarks});
}

/// @nodoc
class __$PaymentCopyWithImpl<$Res> extends _$PaymentCopyWithImpl<$Res>
    implements _$PaymentCopyWith<$Res> {
  __$PaymentCopyWithImpl(_Payment _value, $Res Function(_Payment) _then)
      : super(_value, (v) => _then(v as _Payment));

  @override
  _Payment get _value => super._value as _Payment;

  @override
  $Res call({
    Object? id = freezed,
    Object? companyId = freezed,
    Object? amount = freezed,
    Object? date = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_Payment(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      companyId: companyId == freezed
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      remarks: remarks == freezed
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Payment implements _Payment {
  const _$_Payment(
      {this.id,
      required this.companyId,
      required this.amount,
      required this.date,
      this.remarks});

  factory _$_Payment.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentFromJson(json);

  @override
  final String? id;
  @override
  final String companyId;
  @override
  final double amount;
  @override
  final DateTime date;
  @override
  final String? remarks;

  @override
  String toString() {
    return 'Payment(id: $id, companyId: $companyId, amount: $amount, date: $date, remarks: $remarks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Payment &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.companyId, companyId) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.remarks, remarks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(companyId),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(remarks));

  @JsonKey(ignore: true)
  @override
  _$PaymentCopyWith<_Payment> get copyWith =>
      __$PaymentCopyWithImpl<_Payment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentToJson(this);
  }
}

abstract class _Payment implements Payment {
  const factory _Payment(
      {String? id,
      required String companyId,
      required double amount,
      required DateTime date,
      String? remarks}) = _$_Payment;

  factory _Payment.fromJson(Map<String, dynamic> json) = _$_Payment.fromJson;

  @override
  String? get id;
  @override
  String get companyId;
  @override
  double get amount;
  @override
  DateTime get date;
  @override
  String? get remarks;
  @override
  @JsonKey(ignore: true)
  _$PaymentCopyWith<_Payment> get copyWith =>
      throw _privateConstructorUsedError;
}
