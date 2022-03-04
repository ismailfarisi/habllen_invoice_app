import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/shared/utils/date_util.dart';

class InvoiceListItem extends StatelessWidget {
  final Invoice invoice;

  const InvoiceListItem({Key? key, required this.invoice}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Color color;
    switch (invoice.paymentStatus) {
      case PaymentStatus.open:
        color = Colors.red[700] as Color;
        break;
      case PaymentStatus.partial:
        color = Colors.orange[400] as Color;
        break;
      case PaymentStatus.closed:
        color = Colors.green;
        break;
      default:
        color = Colors.red;
    }
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        onTap: () {
          context.goNamed("invoice_detail_page",
              params: {"invoice_no": invoice.invoiceNo.toString()},
              extra: invoice);
        },
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${invoice.invoiceNo}"),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${invoice.date?.toDateString() ?? "N/A"}",
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${invoice.company?.name ?? "N/A"}",
                      overflow: TextOverflow.fade,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Amt :${invoice.totalPrice}",
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
