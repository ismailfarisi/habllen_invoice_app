import 'package:formz/formz.dart';

extension Validator on FormzInput {
  String? validation() {
    if (this.invalid) return this.validator(this.value);
  }
}
