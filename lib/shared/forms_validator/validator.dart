import 'package:formz/formz.dart';
import 'package:habllen/model/product.dart';

class InputString extends FormzInput<String, String> {
  InputString.dirty(value) : super.dirty(value);
  const InputString.pure([value = ""]) : super.pure(value);

  @override
  String? validator(String? value) {
    if (value!.isEmpty || value.length < 3 || value.length > 100) {
      return "Please give an valid input";
    }
  }
}

class InputAccounts extends FormzInput<double?, String> {
  InputAccounts.dirty(double? value) : super.dirty(value);
  const InputAccounts.pure([double value = 0]) : super.pure(value);

  @override
  String? validator(double? value) {
    if (value == null || value.isNegative || value == 0 || value > 9999999) {
      return "Please give a valid amount";
    }
  }
}

class InputIdCode extends FormzInput<int?, String> {
  InputIdCode.dirty(int? value) : super.dirty(value);
  const InputIdCode.pure([int value = 0]) : super.pure(value);

  @override
  String? validator(int? value) {
    if (value == null || value.isNegative || value == 0) {
      return "Please give a valid code";
    }
  }
}

class InputProduct extends FormzInput<Product?, String> {
  InputProduct.dirty(Product? value) : super.dirty(value);
  const InputProduct.pure([Product? value]) : super.pure(value);

  @override
  String? validator(Product? value) {
    if (value == null) {
      return "Please select a product";
    }
  }
}
