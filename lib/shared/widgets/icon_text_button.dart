import 'package:flutter/material.dart';

typedef OnTapCallback = void Function();

class IconTextButton extends StatelessWidget {
  const IconTextButton(
      {Key? key, required this.icon, required this.text, required this.onTap})
      : super(key: key);

  final Widget icon;
  final Widget text;
  final OnTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(height: 2),
          text,
        ],
      ),
    );
  }
}
