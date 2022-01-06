import 'package:flutter/material.dart';

typedef _Validator = String? Function(String?);
typedef _OnSubmitted = void Function();
typedef _OnChanged = void Function(String);

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.focusNode,
      this.controller,
      required this.helperText,
      this.validator,
      this.keyboardType,
      this.onSubmitted,
      this.textInputAction,
      this.onChanged,
      this.errorText,
      this.initialValue})
      : super(key: key);
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String helperText;
  final String? initialValue;
  final _Validator? validator;
  final TextInputType? keyboardType;
  final _OnSubmitted? onSubmitted;
  final _OnChanged? onChanged;
  final TextInputAction? textInputAction;
  final String? errorText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: TextFormField(
        textInputAction: textInputAction ?? TextInputAction.next,
        onEditingComplete: onSubmitted,
        onChanged: onChanged,
        focusNode: focusNode,
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        initialValue: initialValue,
        decoration:
            InputDecoration(labelText: helperText, errorText: errorText),
      ),
    );
  }
}
