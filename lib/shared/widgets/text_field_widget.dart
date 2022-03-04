import 'package:flutter/material.dart';
import 'package:habllen/shared/widgets/custom_paddings.dart';

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
      this.initialValue,
      this.obscureText})
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
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return HorizonalPadding(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(helperText),
          TextFormField(
            textInputAction: textInputAction ?? TextInputAction.next,
            onEditingComplete: onSubmitted,
            onChanged: onChanged,
            focusNode: focusNode,
            keyboardType: keyboardType,
            validator: validator,
            controller: controller,
            initialValue: initialValue,
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
                constraints: BoxConstraints(maxHeight: 48),
                errorText: errorText,
                border: UnderlineInputBorder()),
          ),
        ],
      ),
    );
  }
}
