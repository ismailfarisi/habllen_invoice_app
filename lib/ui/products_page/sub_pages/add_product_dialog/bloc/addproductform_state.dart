part of 'addproductform_bloc.dart';

enum Status { initial, loading, success, failed }

class AddProductFormState extends Equatable {
  const AddProductFormState({
    this.productName = const InputString.pure(),
    this.price = const InputAccounts.pure(),
    this.stock = const InputAccounts.pure(),
    this.hsnCode = const InputString.pure(),
    this.id = const InputIdCode.pure(),
    this.status = FormzStatus.pure,
    this.gstPercentage = const InputAccounts.pure(),
  });

  final FormzStatus status;
  final InputString productName;
  final InputAccounts price;
  final InputAccounts stock;
  final InputString hsnCode;
  final InputIdCode id;
  final InputAccounts gstPercentage;

  @override
  List<Object> get props =>
      [status, productName, price, stock, hsnCode, id, gstPercentage];

  AddProductFormState copyWith(
      {FormzStatus? status,
      InputAccounts? price,
      InputAccounts? stock,
      InputString? name,
      InputIdCode? id,
      InputString? hsnCode,
      InputAccounts? gstPercentage}) {
    return AddProductFormState(
        status: status ?? this.status,
        price: price ?? this.price,
        productName: name ?? this.productName,
        stock: stock ?? this.stock,
        id: id ?? this.id,
        hsnCode: hsnCode ?? this.hsnCode,
        gstPercentage: gstPercentage ?? this.gstPercentage);
  }

  factory AddProductFormState.initial(Product? product) {
    final state = AddProductFormState(
      productName: InputString.dirty(product?.name),
      price: InputAccounts.dirty(product?.price),
      stock: InputAccounts.dirty(product?.currentStock),
      hsnCode: InputString.dirty(product?.hsnCode),
      id: InputIdCode.dirty(product?.code),
      gstPercentage: InputAccounts.dirty(product?.gstPercentage),
    );
    print(state);
    return state;
  }
}
