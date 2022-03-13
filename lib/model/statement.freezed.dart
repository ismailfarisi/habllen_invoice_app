// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'statement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StatementTearOff {
  const _$StatementTearOff();

  _Statement call(
      {String? id,
      required DateTime date,
      required String description,
      required double credit,
      required double debit,
      double? balance}) {
    return _Statement(
      id: id,
      date: date,
      description: description,
      credit: credit,
      debit: debit,
      balance: balance,
    );
  }
}

/// @nodoc
const $Statement = _$StatementTearOff();

/// @nodoc
mixin _$Statement {
  String? get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get credit => throw _privateConstructorUsedError;
  double get debit => throw _privateConstructorUsedError;
  double? get balance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatementCopyWith<Statement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatementCopyWith<$Res> {
  factory $StatementCopyWith(Statement value, $Res Function(Statement) then) =
      _$StatementCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      DateTime date,
      String description,
      double credit,
      double debit,
      double? balance});
}

/// @nodoc
class _$StatementCopyWithImpl<$Res> implements $StatementCopyWith<$Res> {
  _$StatementCopyWithImpl(this._value, this._then);

  final Statement _value;
  // ignore: unused_field
  final $Res Function(Statement) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? description = freezed,
    Object? credit = freezed,
    Object? debit = freezed,
    Object? balance = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      credit: credit == freezed
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as double,
      debit: debit == freezed
          ? _value.debit
          : debit // ignore: cast_nullable_to_non_nullable
              as double,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$StatementCopyWith<$Res> implements $StatementCopyWith<$Res> {
  factory _$StatementCopyWith(
          _Statement value, $Res Function(_Statement) then) =
      __$StatementCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      DateTime date,
      String description,
      double credit,
      double debit,
      double? balance});
}

/// @nodoc
class __$StatementCopyWithImpl<$Res> extends _$StatementCopyWithImpl<$Res>
    implements _$StatementCopyWith<$Res> {
  __$StatementCopyWithImpl(_Statement _value, $Res Function(_Statement) _then)
      : super(_value, (v) => _then(v as _Statement));

  @override
  _Statement get _value => super._value as _Statement;

  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? description = freezed,
    Object? credit = freezed,
    Object? debit = freezed,
    Object? balance = freezed,
  }) {
    return _then(_Statement(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      credit: credit == freezed
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as double,
      debit: debit == freezed
          ? _value.debit
          : debit // ignore: cast_nullable_to_non_nullable
              as double,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$_Statement implements _Statement {
  const _$_Statement(
      {this.id,
      required this.date,
      required this.description,
      required this.credit,
      required this.debit,
      this.balance});

  @override
  final String? id;
  @override
  final DateTime date;
  @override
  final String description;
  @override
  final double credit;
  @override
  final double debit;
  @override
  final double? balance;

  @override
  String toString() {
    return 'Statement(id: $id, date: $date, description: $description, credit: $credit, debit: $debit, balance: $balance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Statement &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.credit, credit) &&
            const DeepCollectionEquality().equals(other.debit, debit) &&
            const DeepCollectionEquality().equals(other.balance, balance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(credit),
      const DeepCollectionEquality().hash(debit),
      const DeepCollectionEquality().hash(balance));

  @JsonKey(ignore: true)
  @override
  _$StatementCopyWith<_Statement> get copyWith =>
      __$StatementCopyWithImpl<_Statement>(this, _$identity);
}

abstract class _Statement implements Statement {
  const factory _Statement(
      {String? id,
      required DateTime date,
      required String description,
      required double credit,
      required double debit,
      double? balance}) = _$_Statement;

  @override
  String? get id;
  @override
  DateTime get date;
  @override
  String get description;
  @override
  double get credit;
  @override
  double get debit;
  @override
  double? get balance;
  @override
  @JsonKey(ignore: true)
  _$StatementCopyWith<_Statement> get copyWith =>
      throw _privateConstructorUsedError;
}
