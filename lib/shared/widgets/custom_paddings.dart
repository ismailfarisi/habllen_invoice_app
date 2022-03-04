import 'package:flutter/material.dart';

class HorizonalPadding extends StatelessWidget {
  const HorizonalPadding({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: child,
    );
  }
}

class VerticalBigSpace extends StatelessWidget {
  const VerticalBigSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
    );
  }
}

class VerticalSmallSpace extends StatelessWidget {
  const VerticalSmallSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8,
    );
  }
}

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 12,
    );
  }
}
