// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'invoice_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$InvoiceDetailEventTearOff {
  const _$InvoiceDetailEventTearOff();

  _DateChanged dateChanged(DateTime date) {
    return _DateChanged(
      date,
    );
  }

  _NewProductAdded newProductAdded(InvoiceProduct product) {
    return _NewProductAdded(
      product,
    );
  }

  _ProductDeleted productDeleted(InvoiceProduct product) {
    return _ProductDeleted(
      product,
    );
  }

  _ProductEdited productEdited(InvoiceProduct product) {
    return _ProductEdited(
      product,
    );
  }

  _CompanyAdded companyAdded(Customer company) {
    return _CompanyAdded(
      company,
    );
  }
}

/// @nodoc
const $InvoiceDetailEvent = _$InvoiceDetailEventTearOff();

/// @nodoc
mixin _$InvoiceDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(InvoiceProduct product) newProductAdded,
    required TResult Function(InvoiceProduct product) productDeleted,
    required TResult Function(InvoiceProduct product) productEdited,
    required TResult Function(Customer company) companyAdded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime date)? dateChanged,
    TResult Function(InvoiceProduct product)? newProductAdded,
    TResult Function(InvoiceProduct product)? productDeleted,
    TResult Function(InvoiceProduct product)? productEdited,
    TResult Function(Customer company)? companyAdded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? dateChanged,
    TResult Function(InvoiceProduct product)? newProductAdded,
    TResult Function(InvoiceProduct product)? productDeleted,
    TResult Function(InvoiceProduct product)? productEdited,
    TResult Function(Customer company)? companyAdded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_NewProductAdded value) newProductAdded,
    required TResult Function(_ProductDeleted value) productDeleted,
    required TResult Function(_ProductEdited value) productEdited,
    required TResult Function(_CompanyAdded value) companyAdded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_NewProductAdded value)? newProductAdded,
    TResult Function(_ProductDeleted value)? productDeleted,
    TResult Function(_ProductEdited value)? productEdited,
    TResult Function(_CompanyAdded value)? companyAdded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_NewProductAdded value)? newProductAdded,
    TResult Function(_ProductDeleted value)? productDeleted,
    TResult Function(_ProductEdited value)? productEdited,
    TResult Function(_CompanyAdded value)? companyAdded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceDetailEventCopyWith<$Res> {
  factory $InvoiceDetailEventCopyWith(
          InvoiceDetailEvent value, $Res Function(InvoiceDetailEvent) then) =
      _$InvoiceDetailEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$InvoiceDetailEventCopyWithImpl<$Res>
    implements $InvoiceDetailEventCopyWith<$Res> {
  _$InvoiceDetailEventCopyWithImpl(this._value, this._then);

  final InvoiceDetailEvent _value;
  // ignore: unused_field
  final $Res Function(InvoiceDetailEvent) _then;
}

/// @nodoc
abstract class _$DateChangedCopyWith<$Res> {
  factory _$DateChangedCopyWith(
          _DateChanged value, $Res Function(_DateChanged) then) =
      __$DateChangedCopyWithImpl<$Res>;
  $Res call({DateTime date});
}

/// @nodoc
class __$DateChangedCopyWithImpl<$Res>
    extends _$InvoiceDetailEventCopyWithImpl<$Res>
    implements _$DateChangedCopyWith<$Res> {
  __$DateChangedCopyWithImpl(
      _DateChanged _value, $Res Function(_DateChanged) _then)
      : super(_value, (v) => _then(v as _DateChanged));

  @override
  _DateChanged get _value => super._value as _DateChanged;

  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(_DateChanged(
      date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_DateChanged implements _DateChanged {
  const _$_DateChanged(this.date);

  @override
  final DateTime date;

  @override
  String toString() {
    return 'InvoiceDetailEvent.dateChanged(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DateChanged &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$DateChangedCopyWith<_DateChanged> get copyWith =>
      __$DateChangedCopyWithImpl<_DateChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(InvoiceProduct product) newProductAdded,
    required TResult Function(InvoiceProduct product) productDeleted,
    required TResult Function(InvoiceProduct product) productEdited,
    required TResult Function(Customer company) companyAdded,
  }) {
    return dateChanged(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime date)? dateChanged,
    TResult Function(InvoiceProduct product)? newProductAdded,
    TResult Function(InvoiceProduct product)? productDeleted,
    TResult Function(InvoiceProduct product)? productEdited,
    TResult Function(Customer company)? companyAdded,
  }) {
    return dateChanged?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? dateChanged,
    TResult Function(InvoiceProduct product)? newProductAdded,
    TResult Function(InvoiceProduct product)? productDeleted,
    TResult Function(InvoiceProduct product)? productEdited,
    TResult Function(Customer company)? companyAdded,
    required TResult orElse(),
  }) {
    if (dateChanged != null) {
      return dateChanged(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_NewProductAdded value) newProductAdded,
    required TResult Function(_ProductDeleted value) productDeleted,
    required TResult Function(_ProductEdited value) productEdited,
    required TResult Function(_CompanyAdded value) companyAdded,
  }) {
    return dateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_NewProductAdded value)? newProductAdded,
    TResult Function(_ProductDeleted value)? productDeleted,
    TResult Function(_ProductEdited value)? productEdited,
    TResult Function(_CompanyAdded value)? companyAdded,
  }) {
    return dateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_NewProductAdded value)? newProductAdded,
    TResult Function(_ProductDeleted value)? productDeleted,
    TResult Function(_ProductEdited value)? productEdited,
    TResult Function(_CompanyAdded value)? companyAdded,
    required TResult orElse(),
  }) {
    if (dateChanged != null) {
      return dateChanged(this);
    }
    return orElse();
  }
}

abstract class _DateChanged implements InvoiceDetailEvent {
  const factory _DateChanged(DateTime date) = _$_DateChanged;

  DateTime get date;
  @JsonKey(ignore: true)
  _$DateChangedCopyWith<_DateChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$NewProductAddedCopyWith<$Res> {
  factory _$NewProductAddedCopyWith(
          _NewProductAdded value, $Res Function(_NewProductAdded) then) =
      __$NewProductAddedCopyWithImpl<$Res>;
  $Res call({InvoiceProduct product});
}

/// @nodoc
class __$NewProductAddedCopyWithImpl<$Res>
    extends _$InvoiceDetailEventCopyWithImpl<$Res>
    implements _$NewProductAddedCopyWith<$Res> {
  __$NewProductAddedCopyWithImpl(
      _NewProductAdded _value, $Res Function(_NewProductAdded) _then)
      : super(_value, (v) => _then(v as _NewProductAdded));

  @override
  _NewProductAdded get _value => super._value as _NewProductAdded;

  @override
  $Res call({
    Object? product = freezed,
  }) {
    return _then(_NewProductAdded(
      product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as InvoiceProduct,
    ));
  }
}

/// @nodoc

class _$_NewProductAdded implements _NewProductAdded {
  const _$_NewProductAdded(this.product);

  @override
  final InvoiceProduct product;

  @override
  String toString() {
    return 'InvoiceDetailEvent.newProductAdded(product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewProductAdded &&
            const DeepCollectionEquality().equals(other.product, product));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(product));

  @JsonKey(ignore: true)
  @override
  _$NewProductAddedCopyWith<_NewProductAdded> get copyWith =>
      __$NewProductAddedCopyWithImpl<_NewProductAdded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(InvoiceProduct product) newProductAdded,
    required TResult Function(InvoiceProduct product) productDeleted,
    required TResult Function(InvoiceProduct product) productEdited,
    required TResult Function(Customer company) companyAdded,
  }) {
    return newProductAdded(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime date)? dateChanged,
    TResult Function(InvoiceProduct product)? newProductAdded,
    TResult Function(InvoiceProduct product)? productDeleted,
    TResult Function(InvoiceProduct product)? productEdited,
    TResult Function(Customer company)? companyAdded,
  }) {
    return newProductAdded?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? dateChanged,
    TResult Function(InvoiceProduct product)? newProductAdded,
    TResult Function(InvoiceProduct product)? productDeleted,
    TResult Function(InvoiceProduct product)? productEdited,
    TResult Function(Customer company)? companyAdded,
    required TResult orElse(),
  }) {
    if (newProductAdded != null) {
      return newProductAdded(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_NewProductAdded value) newProductAdded,
    required TResult Function(_ProductDeleted value) productDeleted,
    required TResult Function(_ProductEdited value) productEdited,
    required TResult Function(_CompanyAdded value) companyAdded,
  }) {
    return newProductAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_NewProductAdded value)? newProductAdded,
    TResult Function(_ProductDeleted value)? productDeleted,
    TResult Function(_ProductEdited value)? productEdited,
    TResult Function(_CompanyAdded value)? companyAdded,
  }) {
    return newProductAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_NewProductAdded value)? newProductAdded,
    TResult Function(_ProductDeleted value)? productDeleted,
    TResult Function(_ProductEdited value)? productEdited,
    TResult Function(_CompanyAdded value)? companyAdded,
    required TResult orElse(),
  }) {
    if (newProductAdded != null) {
      return newProductAdded(this);
    }
    return orElse();
  }
}

abstract class _NewProductAdded implements InvoiceDetailEvent {
  const factory _NewProductAdded(InvoiceProduct product) = _$_NewProductAdded;

  InvoiceProduct get product;
  @JsonKey(ignore: true)
  _$NewProductAddedCopyWith<_NewProductAdded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ProductDeletedCopyWith<$Res> {
  factory _$ProductDeletedCopyWith(
          _ProductDeleted value, $Res Function(_ProductDeleted) then) =
      __$ProductDeletedCopyWithImpl<$Res>;
  $Res call({InvoiceProduct product});
}

/// @nodoc
class __$ProductDeletedCopyWithImpl<$Res>
    extends _$InvoiceDetailEventCopyWithImpl<$Res>
    implements _$ProductDeletedCopyWith<$Res> {
  __$ProductDeletedCopyWithImpl(
      _ProductDeleted _value, $Res Function(_ProductDeleted) _then)
      : super(_value, (v) => _then(v as _ProductDeleted));

  @override
  _ProductDeleted get _value => super._value as _ProductDeleted;

  @override
  $Res call({
    Object? product = freezed,
  }) {
    return _then(_ProductDeleted(
      product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as InvoiceProduct,
    ));
  }
}

/// @nodoc

class _$_ProductDeleted implements _ProductDeleted {
  const _$_ProductDeleted(this.product);

  @override
  final InvoiceProduct product;

  @override
  String toString() {
    return 'InvoiceDetailEvent.productDeleted(product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductDeleted &&
            const DeepCollectionEquality().equals(other.product, product));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(product));

  @JsonKey(ignore: true)
  @override
  _$ProductDeletedCopyWith<_ProductDeleted> get copyWith =>
      __$ProductDeletedCopyWithImpl<_ProductDeleted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(InvoiceProduct product) newProductAdded,
    required TResult Function(InvoiceProduct product) productDeleted,
    required TResult Function(InvoiceProduct product) productEdited,
    required TResult Function(Customer company) companyAdded,
  }) {
    return productDeleted(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime date)? dateChanged,
    TResult Function(InvoiceProduct product)? newProductAdded,
    TResult Function(InvoiceProduct product)? productDeleted,
    TResult Function(InvoiceProduct product)? productEdited,
    TResult Function(Customer company)? companyAdded,
  }) {
    return productDeleted?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? dateChanged,
    TResult Function(InvoiceProduct product)? newProductAdded,
    TResult Function(InvoiceProduct product)? productDeleted,
    TResult Function(InvoiceProduct product)? productEdited,
    TResult Function(Customer company)? companyAdded,
    required TResult orElse(),
  }) {
    if (productDeleted != null) {
      return productDeleted(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_NewProductAdded value) newProductAdded,
    required TResult Function(_ProductDeleted value) productDeleted,
    required TResult Function(_ProductEdited value) productEdited,
    required TResult Function(_CompanyAdded value) companyAdded,
  }) {
    return productDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_NewProductAdded value)? newProductAdded,
    TResult Function(_ProductDeleted value)? productDeleted,
    TResult Function(_ProductEdited value)? productEdited,
    TResult Function(_CompanyAdded value)? companyAdded,
  }) {
    return productDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_NewProductAdded value)? newProductAdded,
    TResult Function(_ProductDeleted value)? productDeleted,
    TResult Function(_ProductEdited value)? productEdited,
    TResult Function(_CompanyAdded value)? companyAdded,
    required TResult orElse(),
  }) {
    if (productDeleted != null) {
      return productDeleted(this);
    }
    return orElse();
  }
}

abstract class _ProductDeleted implements InvoiceDetailEvent {
  const factory _ProductDeleted(InvoiceProduct product) = _$_ProductDeleted;

  InvoiceProduct get product;
  @JsonKey(ignore: true)
  _$ProductDeletedCopyWith<_ProductDeleted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ProductEditedCopyWith<$Res> {
  factory _$ProductEditedCopyWith(
          _ProductEdited value, $Res Function(_ProductEdited) then) =
      __$ProductEditedCopyWithImpl<$Res>;
  $Res call({InvoiceProduct product});
}

/// @nodoc
class __$ProductEditedCopyWithImpl<$Res>
    extends _$InvoiceDetailEventCopyWithImpl<$Res>
    implements _$ProductEditedCopyWith<$Res> {
  __$ProductEditedCopyWithImpl(
      _ProductEdited _value, $Res Function(_ProductEdited) _then)
      : super(_value, (v) => _then(v as _ProductEdited));

  @override
  _ProductEdited get _value => super._value as _ProductEdited;

  @override
  $Res call({
    Object? product = freezed,
  }) {
    return _then(_ProductEdited(
      product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as InvoiceProduct,
    ));
  }
}

/// @nodoc

class _$_ProductEdited implements _ProductEdited {
  const _$_ProductEdited(this.product);

  @override
  final InvoiceProduct product;

  @override
  String toString() {
    return 'InvoiceDetailEvent.productEdited(product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductEdited &&
            const DeepCollectionEquality().equals(other.product, product));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(product));

  @JsonKey(ignore: true)
  @override
  _$ProductEditedCopyWith<_ProductEdited> get copyWith =>
      __$ProductEditedCopyWithImpl<_ProductEdited>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(InvoiceProduct product) newProductAdded,
    required TResult Function(InvoiceProduct product) productDeleted,
    required TResult Function(InvoiceProduct product) productEdited,
    required TResult Function(Customer company) companyAdded,
  }) {
    return productEdited(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime date)? dateChanged,
    TResult Function(InvoiceProduct product)? newProductAdded,
    TResult Function(InvoiceProduct product)? productDeleted,
    TResult Function(InvoiceProduct product)? productEdited,
    TResult Function(Customer company)? companyAdded,
  }) {
    return productEdited?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? dateChanged,
    TResult Function(InvoiceProduct product)? newProductAdded,
    TResult Function(InvoiceProduct product)? productDeleted,
    TResult Function(InvoiceProduct product)? productEdited,
    TResult Function(Customer company)? companyAdded,
    required TResult orElse(),
  }) {
    if (productEdited != null) {
      return productEdited(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_NewProductAdded value) newProductAdded,
    required TResult Function(_ProductDeleted value) productDeleted,
    required TResult Function(_ProductEdited value) productEdited,
    required TResult Function(_CompanyAdded value) companyAdded,
  }) {
    return productEdited(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_NewProductAdded value)? newProductAdded,
    TResult Function(_ProductDeleted value)? productDeleted,
    TResult Function(_ProductEdited value)? productEdited,
    TResult Function(_CompanyAdded value)? companyAdded,
  }) {
    return productEdited?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_NewProductAdded value)? newProductAdded,
    TResult Function(_ProductDeleted value)? productDeleted,
    TResult Function(_ProductEdited value)? productEdited,
    TResult Function(_CompanyAdded value)? companyAdded,
    required TResult orElse(),
  }) {
    if (productEdited != null) {
      return productEdited(this);
    }
    return orElse();
  }
}

abstract class _ProductEdited implements InvoiceDetailEvent {
  const factory _ProductEdited(InvoiceProduct product) = _$_ProductEdited;

  InvoiceProduct get product;
  @JsonKey(ignore: true)
  _$ProductEditedCopyWith<_ProductEdited> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$CompanyAddedCopyWith<$Res> {
  factory _$CompanyAddedCopyWith(
          _CompanyAdded value, $Res Function(_CompanyAdded) then) =
      __$CompanyAddedCopyWithImpl<$Res>;
  $Res call({Customer company});
}

/// @nodoc
class __$CompanyAddedCopyWithImpl<$Res>
    extends _$InvoiceDetailEventCopyWithImpl<$Res>
    implements _$CompanyAddedCopyWith<$Res> {
  __$CompanyAddedCopyWithImpl(
      _CompanyAdded _value, $Res Function(_CompanyAdded) _then)
      : super(_value, (v) => _then(v as _CompanyAdded));

  @override
  _CompanyAdded get _value => super._value as _CompanyAdded;

  @override
  $Res call({
    Object? company = freezed,
  }) {
    return _then(_CompanyAdded(
      company == freezed
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Customer,
    ));
  }
}

/// @nodoc

class _$_CompanyAdded implements _CompanyAdded {
  const _$_CompanyAdded(this.company);

  @override
  final Customer company;

  @override
  String toString() {
    return 'InvoiceDetailEvent.companyAdded(company: $company)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CompanyAdded &&
            const DeepCollectionEquality().equals(other.company, company));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(company));

  @JsonKey(ignore: true)
  @override
  _$CompanyAddedCopyWith<_CompanyAdded> get copyWith =>
      __$CompanyAddedCopyWithImpl<_CompanyAdded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) dateChanged,
    required TResult Function(InvoiceProduct product) newProductAdded,
    required TResult Function(InvoiceProduct product) productDeleted,
    required TResult Function(InvoiceProduct product) productEdited,
    required TResult Function(Customer company) companyAdded,
  }) {
    return companyAdded(company);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime date)? dateChanged,
    TResult Function(InvoiceProduct product)? newProductAdded,
    TResult Function(InvoiceProduct product)? productDeleted,
    TResult Function(InvoiceProduct product)? productEdited,
    TResult Function(Customer company)? companyAdded,
  }) {
    return companyAdded?.call(company);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? dateChanged,
    TResult Function(InvoiceProduct product)? newProductAdded,
    TResult Function(InvoiceProduct product)? productDeleted,
    TResult Function(InvoiceProduct product)? productEdited,
    TResult Function(Customer company)? companyAdded,
    required TResult orElse(),
  }) {
    if (companyAdded != null) {
      return companyAdded(company);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DateChanged value) dateChanged,
    required TResult Function(_NewProductAdded value) newProductAdded,
    required TResult Function(_ProductDeleted value) productDeleted,
    required TResult Function(_ProductEdited value) productEdited,
    required TResult Function(_CompanyAdded value) companyAdded,
  }) {
    return companyAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_NewProductAdded value)? newProductAdded,
    TResult Function(_ProductDeleted value)? productDeleted,
    TResult Function(_ProductEdited value)? productEdited,
    TResult Function(_CompanyAdded value)? companyAdded,
  }) {
    return companyAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DateChanged value)? dateChanged,
    TResult Function(_NewProductAdded value)? newProductAdded,
    TResult Function(_ProductDeleted value)? productDeleted,
    TResult Function(_ProductEdited value)? productEdited,
    TResult Function(_CompanyAdded value)? companyAdded,
    required TResult orElse(),
  }) {
    if (companyAdded != null) {
      return companyAdded(this);
    }
    return orElse();
  }
}

abstract class _CompanyAdded implements InvoiceDetailEvent {
  const factory _CompanyAdded(Customer company) = _$_CompanyAdded;

  Customer get company;
  @JsonKey(ignore: true)
  _$CompanyAddedCopyWith<_CompanyAdded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$InvoiceDetailStateTearOff {
  const _$InvoiceDetailStateTearOff();

  _InvoiceDetailState call(
      {InputInvoice inputInvoice = const InputInvoice.pure(),
      FormzStatus invoiceStatus = FormzStatus.pure}) {
    return _InvoiceDetailState(
      inputInvoice: inputInvoice,
      invoiceStatus: invoiceStatus,
    );
  }
}

/// @nodoc
const $InvoiceDetailState = _$InvoiceDetailStateTearOff();

/// @nodoc
mixin _$InvoiceDetailState {
  InputInvoice get inputInvoice => throw _privateConstructorUsedError;
  FormzStatus get invoiceStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InvoiceDetailStateCopyWith<InvoiceDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceDetailStateCopyWith<$Res> {
  factory $InvoiceDetailStateCopyWith(
          InvoiceDetailState value, $Res Function(InvoiceDetailState) then) =
      _$InvoiceDetailStateCopyWithImpl<$Res>;
  $Res call({InputInvoice inputInvoice, FormzStatus invoiceStatus});
}

/// @nodoc
class _$InvoiceDetailStateCopyWithImpl<$Res>
    implements $InvoiceDetailStateCopyWith<$Res> {
  _$InvoiceDetailStateCopyWithImpl(this._value, this._then);

  final InvoiceDetailState _value;
  // ignore: unused_field
  final $Res Function(InvoiceDetailState) _then;

  @override
  $Res call({
    Object? inputInvoice = freezed,
    Object? invoiceStatus = freezed,
  }) {
    return _then(_value.copyWith(
      inputInvoice: inputInvoice == freezed
          ? _value.inputInvoice
          : inputInvoice // ignore: cast_nullable_to_non_nullable
              as InputInvoice,
      invoiceStatus: invoiceStatus == freezed
          ? _value.invoiceStatus
          : invoiceStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc
abstract class _$InvoiceDetailStateCopyWith<$Res>
    implements $InvoiceDetailStateCopyWith<$Res> {
  factory _$InvoiceDetailStateCopyWith(
          _InvoiceDetailState value, $Res Function(_InvoiceDetailState) then) =
      __$InvoiceDetailStateCopyWithImpl<$Res>;
  @override
  $Res call({InputInvoice inputInvoice, FormzStatus invoiceStatus});
}

/// @nodoc
class __$InvoiceDetailStateCopyWithImpl<$Res>
    extends _$InvoiceDetailStateCopyWithImpl<$Res>
    implements _$InvoiceDetailStateCopyWith<$Res> {
  __$InvoiceDetailStateCopyWithImpl(
      _InvoiceDetailState _value, $Res Function(_InvoiceDetailState) _then)
      : super(_value, (v) => _then(v as _InvoiceDetailState));

  @override
  _InvoiceDetailState get _value => super._value as _InvoiceDetailState;

  @override
  $Res call({
    Object? inputInvoice = freezed,
    Object? invoiceStatus = freezed,
  }) {
    return _then(_InvoiceDetailState(
      inputInvoice: inputInvoice == freezed
          ? _value.inputInvoice
          : inputInvoice // ignore: cast_nullable_to_non_nullable
              as InputInvoice,
      invoiceStatus: invoiceStatus == freezed
          ? _value.invoiceStatus
          : invoiceStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_InvoiceDetailState implements _InvoiceDetailState {
  const _$_InvoiceDetailState(
      {this.inputInvoice = const InputInvoice.pure(),
      this.invoiceStatus = FormzStatus.pure});

  @JsonKey()
  @override
  final InputInvoice inputInvoice;
  @JsonKey()
  @override
  final FormzStatus invoiceStatus;

  @override
  String toString() {
    return 'InvoiceDetailState(inputInvoice: $inputInvoice, invoiceStatus: $invoiceStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvoiceDetailState &&
            const DeepCollectionEquality()
                .equals(other.inputInvoice, inputInvoice) &&
            const DeepCollectionEquality()
                .equals(other.invoiceStatus, invoiceStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(inputInvoice),
      const DeepCollectionEquality().hash(invoiceStatus));

  @JsonKey(ignore: true)
  @override
  _$InvoiceDetailStateCopyWith<_InvoiceDetailState> get copyWith =>
      __$InvoiceDetailStateCopyWithImpl<_InvoiceDetailState>(this, _$identity);
}

abstract class _InvoiceDetailState implements InvoiceDetailState {
  const factory _InvoiceDetailState(
      {InputInvoice inputInvoice,
      FormzStatus invoiceStatus}) = _$_InvoiceDetailState;

  @override
  InputInvoice get inputInvoice;
  @override
  FormzStatus get invoiceStatus;
  @override
  @JsonKey(ignore: true)
  _$InvoiceDetailStateCopyWith<_InvoiceDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
