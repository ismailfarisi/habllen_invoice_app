import 'package:flutter/material.dart';

typedef _Validator = String? Function(String?);
typedef _OnSubmitted = void Function();

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.focusNode,
      this.controller,
      required this.helperText,
      this.validator,
      this.keyboardType,
      this.onSubmitted,
      this.textInputAction})
      : super(key: key);
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String helperText;
  final _Validator? validator;
  final TextInputType? keyboardType;
  final _OnSubmitted? onSubmitted;
  final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: TextFormField(
        textInputAction: textInputAction,
        onEditingComplete: onSubmitted,
        focusNode: focusNode,
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(labelText: helperText),
      ),
    );
  }
}
