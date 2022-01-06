import 'package:formz/formz.dart';

class CompanyName extends FormzInput<String, String> {
  CompanyName.dirty(String value) : super.dirty(value);
  const CompanyName.pure([String value = ""]) : super.pure(value);

  @override
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter company name";
    }
    return null;
  }
}

class Address extends FormzInput<String, String> {
  Address.dirty(String value) : super.dirty(value);
  const Address.pure([String value = ""]) : super.pure(value);

  @override
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter address";
    }
    return null;
  }
}

class Gst extends FormzInput<String, String> {
  const Gst.pure([String value = ""]) : super.pure(value);
  Gst.dirty(String value) : super.dirty(value);

  @override
  String? validator(String? value) {
    if (value == null || value.length != 15) {
      return "Please enter valid GSTIN";
    }
    return null;
  }
}
