part of 'addproductform_bloc.dart';

enum Status { initial, loading, success, failed }

class AddProductFormState extends Equatable {
  const AddProductFormState(
      {this.productName = const InputString.pure(),
      this.price = const InputAccounts.pure(),
      this.stock = const InputAccounts.pure(),
      this.hsnCode = const InputIdCode.pure(),
      this.id = const InputIdCode.pure(),
      this.status = FormzStatus.pure});

  final FormzStatus status;
  final InputString productName;
  final InputAccounts price;
  final InputAccounts stock;
  final InputIdCode hsnCode;
  final InputIdCode id;

  @override
  List<Object> get props => [status, productName, price, stock, hsnCode, id];

  AddProductFormState copyWith(
      {FormzStatus? status,
      InputAccounts? price,
      InputAccounts? stock,
      InputString? name,
      InputIdCode? id,
      InputIdCode? hsnCode}) {
    return AddProductFormState(
        status: status ?? this.status,
        price: price ?? this.price,
        productName: name ?? this.productName,
        stock: stock ?? this.stock,
        id: id ?? this.id,
        hsnCode: hsnCode ?? this.hsnCode);
  }
}
