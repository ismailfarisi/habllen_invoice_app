// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'invoice_product_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$InvoiceProductDetailStateTearOff {
  const _$InvoiceProductDetailStateTearOff();

  _InvoiceProductDetailState call(
      {required String name,
      InputAccounts price = const InputAccounts.pure(),
      InputAccounts quantity = const InputAccounts.pure(),
      FormzStatus status = FormzStatus.pure}) {
    return _InvoiceProductDetailState(
      name: name,
      price: price,
      quantity: quantity,
      status: status,
    );
  }
}

/// @nodoc
const $InvoiceProductDetailState = _$InvoiceProductDetailStateTearOff();

/// @nodoc
mixin _$InvoiceProductDetailState {
  String get name => throw _privateConstructorUsedError;
  InputAccounts get price => throw _privateConstructorUsedError;
  InputAccounts get quantity => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InvoiceProductDetailStateCopyWith<InvoiceProductDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceProductDetailStateCopyWith<$Res> {
  factory $InvoiceProductDetailStateCopyWith(InvoiceProductDetailState value,
          $Res Function(InvoiceProductDetailState) then) =
      _$InvoiceProductDetailStateCopyWithImpl<$Res>;
  $Res call(
      {String name,
      InputAccounts price,
      InputAccounts quantity,
      FormzStatus status});
}

/// @nodoc
class _$InvoiceProductDetailStateCopyWithImpl<$Res>
    implements $InvoiceProductDetailStateCopyWith<$Res> {
  _$InvoiceProductDetailStateCopyWithImpl(this._value, this._then);

  final InvoiceProductDetailState _value;
  // ignore: unused_field
  final $Res Function(InvoiceProductDetailState) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as InputAccounts,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as InputAccounts,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc
abstract class _$InvoiceProductDetailStateCopyWith<$Res>
    implements $InvoiceProductDetailStateCopyWith<$Res> {
  factory _$InvoiceProductDetailStateCopyWith(_InvoiceProductDetailState value,
          $Res Function(_InvoiceProductDetailState) then) =
      __$InvoiceProductDetailStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      InputAccounts price,
      InputAccounts quantity,
      FormzStatus status});
}

/// @nodoc
class __$InvoiceProductDetailStateCopyWithImpl<$Res>
    extends _$InvoiceProductDetailStateCopyWithImpl<$Res>
    implements _$InvoiceProductDetailStateCopyWith<$Res> {
  __$InvoiceProductDetailStateCopyWithImpl(_InvoiceProductDetailState _value,
      $Res Function(_InvoiceProductDetailState) _then)
      : super(_value, (v) => _then(v as _InvoiceProductDetailState));

  @override
  _InvoiceProductDetailState get _value =>
      super._value as _InvoiceProductDetailState;

  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? status = freezed,
  }) {
    return _then(_InvoiceProductDetailState(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as InputAccounts,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as InputAccounts,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_InvoiceProductDetailState implements _InvoiceProductDetailState {
  _$_InvoiceProductDetailState(
      {required this.name,
      this.price = const InputAccounts.pure(),
      this.quantity = const InputAccounts.pure(),
      this.status = FormzStatus.pure});

  @override
  final String name;
  @JsonKey()
  @override
  final InputAccounts price;
  @JsonKey()
  @override
  final InputAccounts quantity;
  @JsonKey()
  @override
  final FormzStatus status;

  @override
  String toString() {
    return 'InvoiceProductDetailState(name: $name, price: $price, quantity: $quantity, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvoiceProductDetailState &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$InvoiceProductDetailStateCopyWith<_InvoiceProductDetailState>
      get copyWith =>
          __$InvoiceProductDetailStateCopyWithImpl<_InvoiceProductDetailState>(
              this, _$identity);
}

abstract class _InvoiceProductDetailState implements InvoiceProductDetailState {
  factory _InvoiceProductDetailState(
      {required String name,
      InputAccounts price,
      InputAccounts quantity,
      FormzStatus status}) = _$_InvoiceProductDetailState;

  @override
  String get name;
  @override
  InputAccounts get price;
  @override
  InputAccounts get quantity;
  @override
  FormzStatus get status;
  @override
  @JsonKey(ignore: true)
  _$InvoiceProductDetailStateCopyWith<_InvoiceProductDetailState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$InvoiceProductDetailEventTearOff {
  const _$InvoiceProductDetailEventTearOff();

  _LoadInvoiceProductDetail loadInvoiceProductDetail(
      {required String invoiceProductId}) {
    return _LoadInvoiceProductDetail(
      invoiceProductId: invoiceProductId,
    );
  }

  _QuantityChanged quantityChanged(String quantity) {
    return _QuantityChanged(
      quantity,
    );
  }

  _PriceChanged priceChanged(String price) {
    return _PriceChanged(
      price,
    );
  }

  _SaveInvoiceProductDetail saveInvoiceProductDetail() {
    return const _SaveInvoiceProductDetail();
  }
}

/// @nodoc
const $InvoiceProductDetailEvent = _$InvoiceProductDetailEventTearOff();

/// @nodoc
mixin _$InvoiceProductDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String invoiceProductId) loadInvoiceProductDetail,
    required TResult Function(String quantity) quantityChanged,
    required TResult Function(String price) priceChanged,
    required TResult Function() saveInvoiceProductDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String invoiceProductId)? loadInvoiceProductDetail,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
    TResult Function()? saveInvoiceProductDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String invoiceProductId)? loadInvoiceProductDetail,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
    TResult Function()? saveInvoiceProductDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInvoiceProductDetail value)
        loadInvoiceProductDetail,
    required TResult Function(_QuantityChanged value) quantityChanged,
    required TResult Function(_PriceChanged value) priceChanged,
    required TResult Function(_SaveInvoiceProductDetail value)
        saveInvoiceProductDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadInvoiceProductDetail value)? loadInvoiceProductDetail,
    TResult Function(_QuantityChanged value)? quantityChanged,
    TResult Function(_PriceChanged value)? priceChanged,
    TResult Function(_SaveInvoiceProductDetail value)? saveInvoiceProductDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInvoiceProductDetail value)? loadInvoiceProductDetail,
    TResult Function(_QuantityChanged value)? quantityChanged,
    TResult Function(_PriceChanged value)? priceChanged,
    TResult Function(_SaveInvoiceProductDetail value)? saveInvoiceProductDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceProductDetailEventCopyWith<$Res> {
  factory $InvoiceProductDetailEventCopyWith(InvoiceProductDetailEvent value,
          $Res Function(InvoiceProductDetailEvent) then) =
      _$InvoiceProductDetailEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$InvoiceProductDetailEventCopyWithImpl<$Res>
    implements $InvoiceProductDetailEventCopyWith<$Res> {
  _$InvoiceProductDetailEventCopyWithImpl(this._value, this._then);

  final InvoiceProductDetailEvent _value;
  // ignore: unused_field
  final $Res Function(InvoiceProductDetailEvent) _then;
}

/// @nodoc
abstract class _$LoadInvoiceProductDetailCopyWith<$Res> {
  factory _$LoadInvoiceProductDetailCopyWith(_LoadInvoiceProductDetail value,
          $Res Function(_LoadInvoiceProductDetail) then) =
      __$LoadInvoiceProductDetailCopyWithImpl<$Res>;
  $Res call({String invoiceProductId});
}

/// @nodoc
class __$LoadInvoiceProductDetailCopyWithImpl<$Res>
    extends _$InvoiceProductDetailEventCopyWithImpl<$Res>
    implements _$LoadInvoiceProductDetailCopyWith<$Res> {
  __$LoadInvoiceProductDetailCopyWithImpl(_LoadInvoiceProductDetail _value,
      $Res Function(_LoadInvoiceProductDetail) _then)
      : super(_value, (v) => _then(v as _LoadInvoiceProductDetail));

  @override
  _LoadInvoiceProductDetail get _value =>
      super._value as _LoadInvoiceProductDetail;

  @override
  $Res call({
    Object? invoiceProductId = freezed,
  }) {
    return _then(_LoadInvoiceProductDetail(
      invoiceProductId: invoiceProductId == freezed
          ? _value.invoiceProductId
          : invoiceProductId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoadInvoiceProductDetail implements _LoadInvoiceProductDetail {
  const _$_LoadInvoiceProductDetail({required this.invoiceProductId});

  @override
  final String invoiceProductId;

  @override
  String toString() {
    return 'InvoiceProductDetailEvent.loadInvoiceProductDetail(invoiceProductId: $invoiceProductId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadInvoiceProductDetail &&
            const DeepCollectionEquality()
                .equals(other.invoiceProductId, invoiceProductId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(invoiceProductId));

  @JsonKey(ignore: true)
  @override
  _$LoadInvoiceProductDetailCopyWith<_LoadInvoiceProductDetail> get copyWith =>
      __$LoadInvoiceProductDetailCopyWithImpl<_LoadInvoiceProductDetail>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String invoiceProductId) loadInvoiceProductDetail,
    required TResult Function(String quantity) quantityChanged,
    required TResult Function(String price) priceChanged,
    required TResult Function() saveInvoiceProductDetail,
  }) {
    return loadInvoiceProductDetail(invoiceProductId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String invoiceProductId)? loadInvoiceProductDetail,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
    TResult Function()? saveInvoiceProductDetail,
  }) {
    return loadInvoiceProductDetail?.call(invoiceProductId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String invoiceProductId)? loadInvoiceProductDetail,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
    TResult Function()? saveInvoiceProductDetail,
    required TResult orElse(),
  }) {
    if (loadInvoiceProductDetail != null) {
      return loadInvoiceProductDetail(invoiceProductId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInvoiceProductDetail value)
        loadInvoiceProductDetail,
    required TResult Function(_QuantityChanged value) quantityChanged,
    required TResult Function(_PriceChanged value) priceChanged,
    required TResult Function(_SaveInvoiceProductDetail value)
        saveInvoiceProductDetail,
  }) {
    return loadInvoiceProductDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadInvoiceProductDetail value)? loadInvoiceProductDetail,
    TResult Function(_QuantityChanged value)? quantityChanged,
    TResult Function(_PriceChanged value)? priceChanged,
    TResult Function(_SaveInvoiceProductDetail value)? saveInvoiceProductDetail,
  }) {
    return loadInvoiceProductDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInvoiceProductDetail value)? loadInvoiceProductDetail,
    TResult Function(_QuantityChanged value)? quantityChanged,
    TResult Function(_PriceChanged value)? priceChanged,
    TResult Function(_SaveInvoiceProductDetail value)? saveInvoiceProductDetail,
    required TResult orElse(),
  }) {
    if (loadInvoiceProductDetail != null) {
      return loadInvoiceProductDetail(this);
    }
    return orElse();
  }
}

abstract class _LoadInvoiceProductDetail implements InvoiceProductDetailEvent {
  const factory _LoadInvoiceProductDetail({required String invoiceProductId}) =
      _$_LoadInvoiceProductDetail;

  String get invoiceProductId;
  @JsonKey(ignore: true)
  _$LoadInvoiceProductDetailCopyWith<_LoadInvoiceProductDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$QuantityChangedCopyWith<$Res> {
  factory _$QuantityChangedCopyWith(
          _QuantityChanged value, $Res Function(_QuantityChanged) then) =
      __$QuantityChangedCopyWithImpl<$Res>;
  $Res call({String quantity});
}

/// @nodoc
class __$QuantityChangedCopyWithImpl<$Res>
    extends _$InvoiceProductDetailEventCopyWithImpl<$Res>
    implements _$QuantityChangedCopyWith<$Res> {
  __$QuantityChangedCopyWithImpl(
      _QuantityChanged _value, $Res Function(_QuantityChanged) _then)
      : super(_value, (v) => _then(v as _QuantityChanged));

  @override
  _QuantityChanged get _value => super._value as _QuantityChanged;

  @override
  $Res call({
    Object? quantity = freezed,
  }) {
    return _then(_QuantityChanged(
      quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_QuantityChanged implements _QuantityChanged {
  const _$_QuantityChanged(this.quantity);

  @override
  final String quantity;

  @override
  String toString() {
    return 'InvoiceProductDetailEvent.quantityChanged(quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuantityChanged &&
            const DeepCollectionEquality().equals(other.quantity, quantity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(quantity));

  @JsonKey(ignore: true)
  @override
  _$QuantityChangedCopyWith<_QuantityChanged> get copyWith =>
      __$QuantityChangedCopyWithImpl<_QuantityChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String invoiceProductId) loadInvoiceProductDetail,
    required TResult Function(String quantity) quantityChanged,
    required TResult Function(String price) priceChanged,
    required TResult Function() saveInvoiceProductDetail,
  }) {
    return quantityChanged(quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String invoiceProductId)? loadInvoiceProductDetail,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
    TResult Function()? saveInvoiceProductDetail,
  }) {
    return quantityChanged?.call(quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String invoiceProductId)? loadInvoiceProductDetail,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
    TResult Function()? saveInvoiceProductDetail,
    required TResult orElse(),
  }) {
    if (quantityChanged != null) {
      return quantityChanged(quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInvoiceProductDetail value)
        loadInvoiceProductDetail,
    required TResult Function(_QuantityChanged value) quantityChanged,
    required TResult Function(_PriceChanged value) priceChanged,
    required TResult Function(_SaveInvoiceProductDetail value)
        saveInvoiceProductDetail,
  }) {
    return quantityChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadInvoiceProductDetail value)? loadInvoiceProductDetail,
    TResult Function(_QuantityChanged value)? quantityChanged,
    TResult Function(_PriceChanged value)? priceChanged,
    TResult Function(_SaveInvoiceProductDetail value)? saveInvoiceProductDetail,
  }) {
    return quantityChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInvoiceProductDetail value)? loadInvoiceProductDetail,
    TResult Function(_QuantityChanged value)? quantityChanged,
    TResult Function(_PriceChanged value)? priceChanged,
    TResult Function(_SaveInvoiceProductDetail value)? saveInvoiceProductDetail,
    required TResult orElse(),
  }) {
    if (quantityChanged != null) {
      return quantityChanged(this);
    }
    return orElse();
  }
}

abstract class _QuantityChanged implements InvoiceProductDetailEvent {
  const factory _QuantityChanged(String quantity) = _$_QuantityChanged;

  String get quantity;
  @JsonKey(ignore: true)
  _$QuantityChangedCopyWith<_QuantityChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PriceChangedCopyWith<$Res> {
  factory _$PriceChangedCopyWith(
          _PriceChanged value, $Res Function(_PriceChanged) then) =
      __$PriceChangedCopyWithImpl<$Res>;
  $Res call({String price});
}

/// @nodoc
class __$PriceChangedCopyWithImpl<$Res>
    extends _$InvoiceProductDetailEventCopyWithImpl<$Res>
    implements _$PriceChangedCopyWith<$Res> {
  __$PriceChangedCopyWithImpl(
      _PriceChanged _value, $Res Function(_PriceChanged) _then)
      : super(_value, (v) => _then(v as _PriceChanged));

  @override
  _PriceChanged get _value => super._value as _PriceChanged;

  @override
  $Res call({
    Object? price = freezed,
  }) {
    return _then(_PriceChanged(
      price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PriceChanged implements _PriceChanged {
  const _$_PriceChanged(this.price);

  @override
  final String price;

  @override
  String toString() {
    return 'InvoiceProductDetailEvent.priceChanged(price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PriceChanged &&
            const DeepCollectionEquality().equals(other.price, price));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(price));

  @JsonKey(ignore: true)
  @override
  _$PriceChangedCopyWith<_PriceChanged> get copyWith =>
      __$PriceChangedCopyWithImpl<_PriceChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String invoiceProductId) loadInvoiceProductDetail,
    required TResult Function(String quantity) quantityChanged,
    required TResult Function(String price) priceChanged,
    required TResult Function() saveInvoiceProductDetail,
  }) {
    return priceChanged(price);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String invoiceProductId)? loadInvoiceProductDetail,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
    TResult Function()? saveInvoiceProductDetail,
  }) {
    return priceChanged?.call(price);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String invoiceProductId)? loadInvoiceProductDetail,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
    TResult Function()? saveInvoiceProductDetail,
    required TResult orElse(),
  }) {
    if (priceChanged != null) {
      return priceChanged(price);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInvoiceProductDetail value)
        loadInvoiceProductDetail,
    required TResult Function(_QuantityChanged value) quantityChanged,
    required TResult Function(_PriceChanged value) priceChanged,
    required TResult Function(_SaveInvoiceProductDetail value)
        saveInvoiceProductDetail,
  }) {
    return priceChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadInvoiceProductDetail value)? loadInvoiceProductDetail,
    TResult Function(_QuantityChanged value)? quantityChanged,
    TResult Function(_PriceChanged value)? priceChanged,
    TResult Function(_SaveInvoiceProductDetail value)? saveInvoiceProductDetail,
  }) {
    return priceChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInvoiceProductDetail value)? loadInvoiceProductDetail,
    TResult Function(_QuantityChanged value)? quantityChanged,
    TResult Function(_PriceChanged value)? priceChanged,
    TResult Function(_SaveInvoiceProductDetail value)? saveInvoiceProductDetail,
    required TResult orElse(),
  }) {
    if (priceChanged != null) {
      return priceChanged(this);
    }
    return orElse();
  }
}

abstract class _PriceChanged implements InvoiceProductDetailEvent {
  const factory _PriceChanged(String price) = _$_PriceChanged;

  String get price;
  @JsonKey(ignore: true)
  _$PriceChangedCopyWith<_PriceChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SaveInvoiceProductDetailCopyWith<$Res> {
  factory _$SaveInvoiceProductDetailCopyWith(_SaveInvoiceProductDetail value,
          $Res Function(_SaveInvoiceProductDetail) then) =
      __$SaveInvoiceProductDetailCopyWithImpl<$Res>;
}

/// @nodoc
class __$SaveInvoiceProductDetailCopyWithImpl<$Res>
    extends _$InvoiceProductDetailEventCopyWithImpl<$Res>
    implements _$SaveInvoiceProductDetailCopyWith<$Res> {
  __$SaveInvoiceProductDetailCopyWithImpl(_SaveInvoiceProductDetail _value,
      $Res Function(_SaveInvoiceProductDetail) _then)
      : super(_value, (v) => _then(v as _SaveInvoiceProductDetail));

  @override
  _SaveInvoiceProductDetail get _value =>
      super._value as _SaveInvoiceProductDetail;
}

/// @nodoc

class _$_SaveInvoiceProductDetail implements _SaveInvoiceProductDetail {
  const _$_SaveInvoiceProductDetail();

  @override
  String toString() {
    return 'InvoiceProductDetailEvent.saveInvoiceProductDetail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaveInvoiceProductDetail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String invoiceProductId) loadInvoiceProductDetail,
    required TResult Function(String quantity) quantityChanged,
    required TResult Function(String price) priceChanged,
    required TResult Function() saveInvoiceProductDetail,
  }) {
    return saveInvoiceProductDetail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String invoiceProductId)? loadInvoiceProductDetail,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
    TResult Function()? saveInvoiceProductDetail,
  }) {
    return saveInvoiceProductDetail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String invoiceProductId)? loadInvoiceProductDetail,
    TResult Function(String quantity)? quantityChanged,
    TResult Function(String price)? priceChanged,
    TResult Function()? saveInvoiceProductDetail,
    required TResult orElse(),
  }) {
    if (saveInvoiceProductDetail != null) {
      return saveInvoiceProductDetail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInvoiceProductDetail value)
        loadInvoiceProductDetail,
    required TResult Function(_QuantityChanged value) quantityChanged,
    required TResult Function(_PriceChanged value) priceChanged,
    required TResult Function(_SaveInvoiceProductDetail value)
        saveInvoiceProductDetail,
  }) {
    return saveInvoiceProductDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadInvoiceProductDetail value)? loadInvoiceProductDetail,
    TResult Function(_QuantityChanged value)? quantityChanged,
    TResult Function(_PriceChanged value)? priceChanged,
    TResult Function(_SaveInvoiceProductDetail value)? saveInvoiceProductDetail,
  }) {
    return saveInvoiceProductDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInvoiceProductDetail value)? loadInvoiceProductDetail,
    TResult Function(_QuantityChanged value)? quantityChanged,
    TResult Function(_PriceChanged value)? priceChanged,
    TResult Function(_SaveInvoiceProductDetail value)? saveInvoiceProductDetail,
    required TResult orElse(),
  }) {
    if (saveInvoiceProductDetail != null) {
      return saveInvoiceProductDetail(this);
    }
    return orElse();
  }
}

abstract class _SaveInvoiceProductDetail implements InvoiceProductDetailEvent {
  const factory _SaveInvoiceProductDetail() = _$_SaveInvoiceProductDetail;
}
