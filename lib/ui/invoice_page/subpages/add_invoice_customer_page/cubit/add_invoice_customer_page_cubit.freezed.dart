// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_invoice_customer_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AddInvoiceCustomerPageStateTearOff {
  const _$AddInvoiceCustomerPageStateTearOff();

  _AddInvoiceCustomerPageState call(
      {List<Customer> companies = const [], Customer? selectedCustomer}) {
    return _AddInvoiceCustomerPageState(
      companies: companies,
      selectedCustomer: selectedCustomer,
    );
  }
}

/// @nodoc
const $AddInvoiceCustomerPageState = _$AddInvoiceCustomerPageStateTearOff();

/// @nodoc
mixin _$AddInvoiceCustomerPageState {
  List<Customer> get companies => throw _privateConstructorUsedError;
  Customer? get selectedCustomer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddInvoiceCustomerPageStateCopyWith<AddInvoiceCustomerPageState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddInvoiceCustomerPageStateCopyWith<$Res> {
  factory $AddInvoiceCustomerPageStateCopyWith(
          AddInvoiceCustomerPageState value,
          $Res Function(AddInvoiceCustomerPageState) then) =
      _$AddInvoiceCustomerPageStateCopyWithImpl<$Res>;
  $Res call({List<Customer> companies, Customer? selectedCustomer});
}

/// @nodoc
class _$AddInvoiceCustomerPageStateCopyWithImpl<$Res>
    implements $AddInvoiceCustomerPageStateCopyWith<$Res> {
  _$AddInvoiceCustomerPageStateCopyWithImpl(this._value, this._then);

  final AddInvoiceCustomerPageState _value;
  // ignore: unused_field
  final $Res Function(AddInvoiceCustomerPageState) _then;

  @override
  $Res call({
    Object? companies = freezed,
    Object? selectedCustomer = freezed,
  }) {
    return _then(_value.copyWith(
      companies: companies == freezed
          ? _value.companies
          : companies // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
      selectedCustomer: selectedCustomer == freezed
          ? _value.selectedCustomer
          : selectedCustomer // ignore: cast_nullable_to_non_nullable
              as Customer?,
    ));
  }
}

/// @nodoc
abstract class _$AddInvoiceCustomerPageStateCopyWith<$Res>
    implements $AddInvoiceCustomerPageStateCopyWith<$Res> {
  factory _$AddInvoiceCustomerPageStateCopyWith(
          _AddInvoiceCustomerPageState value,
          $Res Function(_AddInvoiceCustomerPageState) then) =
      __$AddInvoiceCustomerPageStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Customer> companies, Customer? selectedCustomer});
}

/// @nodoc
class __$AddInvoiceCustomerPageStateCopyWithImpl<$Res>
    extends _$AddInvoiceCustomerPageStateCopyWithImpl<$Res>
    implements _$AddInvoiceCustomerPageStateCopyWith<$Res> {
  __$AddInvoiceCustomerPageStateCopyWithImpl(
      _AddInvoiceCustomerPageState _value,
      $Res Function(_AddInvoiceCustomerPageState) _then)
      : super(_value, (v) => _then(v as _AddInvoiceCustomerPageState));

  @override
  _AddInvoiceCustomerPageState get _value =>
      super._value as _AddInvoiceCustomerPageState;

  @override
  $Res call({
    Object? companies = freezed,
    Object? selectedCustomer = freezed,
  }) {
    return _then(_AddInvoiceCustomerPageState(
      companies: companies == freezed
          ? _value.companies
          : companies // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
      selectedCustomer: selectedCustomer == freezed
          ? _value.selectedCustomer
          : selectedCustomer // ignore: cast_nullable_to_non_nullable
              as Customer?,
    ));
  }
}

/// @nodoc

class _$_AddInvoiceCustomerPageState implements _AddInvoiceCustomerPageState {
  const _$_AddInvoiceCustomerPageState(
      {this.companies = const [], this.selectedCustomer});

  @JsonKey()
  @override
  final List<Customer> companies;
  @override
  final Customer? selectedCustomer;

  @override
  String toString() {
    return 'AddInvoiceCustomerPageState(companies: $companies, selectedCustomer: $selectedCustomer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddInvoiceCustomerPageState &&
            const DeepCollectionEquality().equals(other.companies, companies) &&
            const DeepCollectionEquality()
                .equals(other.selectedCustomer, selectedCustomer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(companies),
      const DeepCollectionEquality().hash(selectedCustomer));

  @JsonKey(ignore: true)
  @override
  _$AddInvoiceCustomerPageStateCopyWith<_AddInvoiceCustomerPageState>
      get copyWith => __$AddInvoiceCustomerPageStateCopyWithImpl<
          _AddInvoiceCustomerPageState>(this, _$identity);
}

abstract class _AddInvoiceCustomerPageState
    implements AddInvoiceCustomerPageState {
  const factory _AddInvoiceCustomerPageState(
      {List<Customer> companies,
      Customer? selectedCustomer}) = _$_AddInvoiceCustomerPageState;

  @override
  List<Customer> get companies;
  @override
  Customer? get selectedCustomer;
  @override
  @JsonKey(ignore: true)
  _$AddInvoiceCustomerPageStateCopyWith<_AddInvoiceCustomerPageState>
      get copyWith => throw _privateConstructorUsedError;
}
