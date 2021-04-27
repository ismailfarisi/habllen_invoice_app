import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HomePage extends StatelessWidget {
  static Page page() => MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        backgroundColor: Colors.lightGreen[800],
      ),
      body: Container(
        color: Colors.grey[300],
        padding: EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            _GridTile("create invoice"),
            _GridTile("Add expence"),
            _GridTile("add new customer")
          ],
        ),
      ),
    );
  }
}

class _GridTile extends StatefulWidget {
  _GridTile(this.text);
  final text;

  @override
  __GridTileState createState() => __GridTileState();
}

class __GridTileState extends State<_GridTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 0.0,
        color: Colors.lightGreen,
        child: Center(
          child: Text(widget.text),
        ),
      ),
    );
  }
}
