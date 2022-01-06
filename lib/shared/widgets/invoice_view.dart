import 'package:flutter/material.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/shared/widgets/date_util.dart' show DateString;

class InvoiceViewWidget extends StatelessWidget {
  const InvoiceViewWidget({
    Key? key,
    required this.invoice,
  }) : super(key: key);

  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Expanded(flex: 5, child: Text("${invoice.company.name}")),
            Expanded(flex: 3, child: Text("Invoice No. : ${invoice.invoiceNo}"))
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(flex: 5, child: Text("${invoice.company.addressOne}")),
            Expanded(
                flex: 3, child: Text("Date : ${invoice.date.toDateString()}"))
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text("${invoice.company.addressTwo}"),
        SizedBox(
          height: 5,
        ),
        Text("GST : ${invoice.company.gst}"),
        SizedBox(
          height: 20,
        ),
        Expanded(
            flex: 5,
            child: ListView.builder(
                itemCount: invoice.product.length,
                itemBuilder: (context, index) {
                  final product = invoice.product[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name : ${product.product.name}"),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Text(
                                      "HSN Code : ${product.product.hsnCode}")),
                              Expanded(
                                  flex: 3,
                                  child: Text("Qty : ${product.quantity}"))
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 5,
                                  child: Text(
                                      "Item Code : ${product.product.id}")),
                              Expanded(
                                  flex: 5,
                                  child: Text("Unit Price : ${product.price}")),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Expanded(flex: 5, child: SizedBox()),
                              Expanded(
                                  flex: 5,
                                  child: Text(
                                      "Total Price : ${product.totalPrice}")),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                })),
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Amount :"),
                    Text("IGST :"),
                    Text("CGST :"),
                    Text("SGST :"),
                    Text(
                      "Total Amount :",
                      style: Theme.of(context).textTheme.headline6,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${invoice.price}"),
                    Text("${invoice.iGST}"),
                    Text("${invoice.cGST}"),
                    Text("${invoice.sGST}"),
                    Text(
                      "${invoice.totalPrice}",
                      style: Theme.of(context).textTheme.headline6,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
