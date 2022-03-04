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
    final subtitle = Theme.of(context)
        .textTheme
        .subtitle1
        ?.copyWith(fontWeight: FontWeight.bold);
    final bodytext = Theme.of(context)
        .textTheme
        .bodyText1
        ?.copyWith(fontSize: 12, color: Colors.grey);
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ListTile(
            title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: subtitle,
                  ),
                  Text(
                    "product Code : ${productCode.toString()}",
                    style: bodytext,
                  ),
                  Text(
                    "Hsn Code: $hsnCode",
                    style: bodytext,
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "stock : ${stock.toString()}",
                    style: bodytext,
                  ),
                  RichText(
                      text: TextSpan(
                    text: "price : ",
                    children: [
                      TextSpan(
                        text: "\u{20B9}${price.toString()}",
                        style: subtitle,
                      ),
                    ],
                    style: bodytext,
                  )),
                ],
              )
            ],
          ),
        )));
  }
}
