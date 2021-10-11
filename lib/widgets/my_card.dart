import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 1.0),
      child: ListTile(
        onTap: () {},
        title: Text(text),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
