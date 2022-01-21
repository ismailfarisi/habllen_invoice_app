import 'package:flutter/material.dart';

typedef OnTap = void Function();

class MyCard extends StatelessWidget {
  const MyCard({Key? key, required this.text, this.ontap}) : super(key: key);

  final String text;
  final OnTap? ontap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 1.0),
      child: ListTile(
        onTap: ontap,
        title: Text(text),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
