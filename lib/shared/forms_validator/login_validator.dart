import 'package:formz/formz.dart';

class Email extends FormzInput<String, String> {
  const Email.pure([String value = '']) : super.pure(value);
  const Email.dirty(String value) : super.dirty(value);

  @override
  String? validator(String value) {
    return (value != "")
        ? value.contains('@')
            ? null
            : 'Invalid email'
        : "please enter email";
  }
}

class Password extends FormzInput<String, String> {
  const Password.pure([String value = '']) : super.pure(value);
  const Password.dirty(String value) : super.dirty(value);

  @override
  String? validator(String value) {
    return (value != "")
        ? value.length >= 6
            ? null
            : 'Invalid password'
        : "please enter password";
  }
}

class UserName extends FormzInput<String, String> {
  const UserName.pure([String value = '']) : super.pure(value);
  const UserName.dirty(String value) : super.dirty(value);

  @override
  String? validator(String value) {
    return (value != "")
        ? value.length >= 6
            ? null
            : 'username must be atleast 6 characters'
        : "please enter username";
  }
}

class ConfirmPassword extends FormzInput<String, String> {
  const ConfirmPassword.pure([String value = '', this.password = ""])
      : super.pure(value);
  const ConfirmPassword.dirty({required String value, this.password})
      : super.dirty(value);

  final String? password;
  @override
  String? validator(String value) {
    return (value != password) ? "Password doesn't match" : null;
  }
}
