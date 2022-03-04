import 'package:formz/formz.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/model/product.dart';

class InputString extends FormzInput<String?, String> {
  InputString.dirty(String? value) : super.dirty(value);
  const InputString.pure([String? value]) : super.pure(value);

  @override
  String? validator(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.length < 3 ||
        value.length > 100) {
      return "Please give an valid input";
    }
  }
}

class InputAccounts extends FormzInput<double?, String> {
  InputAccounts.dirty(double? value) : super.dirty(value);
  const InputAccounts.pure([double? value]) : super.pure(value);

  @override
  String? validator(double? value) {
    if (value == null || value.isNegative || value == 0 || value > 9999999) {
      return "Please give a valid amount";
    }
  }
}

class InputIdCode extends FormzInput<int?, String> {
  InputIdCode.dirty(int? value) : super.dirty(value);
  const InputIdCode.pure([int? value]) : super.pure(value);

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

class InputInvoice extends FormzInput<Invoice, String> {
  InputInvoice.dirty(Invoice value) : super.dirty(value);
  const InputInvoice.pure([Invoice value = const Invoice()])
      : super.pure(value);

  @override
  String? validator(value) {
    if (value.totalPrice == null) {
      return "total price is required";
    } else if (value.company == null) {
      return "company is null";
    } else if (value.products.isEmpty) {
      return "products is empty";
    } else if (value.price == null) {
      return "price is null";
    }
  }
}

class InputDate extends FormzInput<DateTime, String> {
  const InputDate.dirty(DateTime value) : super.dirty(value);
  InputDate.pure([DateTime? value]) : super.pure(value ?? DateTime.now());

  @override
  String? validator(DateTime? value) {
    if (value == null) {
      return "Please give a valid date";
    }
  }
}

class InputGst extends FormzInput<String, String> {
  const InputGst.pure([String value = ""]) : super.pure(value);
  InputGst.dirty(String value) : super.dirty(value);

  @override
  String? validator(String? value) {
    if (value == null || value.length != 15) {
      return "Please enter valid GSTIN";
    }
    return null;
  }
}
