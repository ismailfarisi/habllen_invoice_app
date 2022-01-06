import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final int? productCode;
  final String hsnCode;
  final double price;
  final double stock;

  const ProductCard(
      {Key? key,
      required this.title,
      this.productCode,
      required this.hsnCode,
      required this.price,
      required this.stock})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            contentPadding: EdgeInsets.all(8.0),
            title: Text(title),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("product Code : ${productCode.toString()}"),
                    Text("Hsn Code: $hsnCode")
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("price : ${price.toString()}"),
                    Text("stock: ${stock.toString()}")
                  ],
                )
              ],
            )));
  }
}
