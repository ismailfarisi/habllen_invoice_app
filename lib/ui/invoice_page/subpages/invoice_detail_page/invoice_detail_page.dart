import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/shared/widgets/invoice_view.dart';

class InvoiceDetailPage extends StatelessWidget {
  const InvoiceDetailPage({Key? key, required this.invoice}) : super(key: key);

  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Invoice",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InvoiceViewWidget(invoice: invoice),
            )),
            Container(
              color: Theme.of(context)
                  .colorScheme
                  .copyWith(surface: Colors.white)
                  .surface,
              height: 55,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        context.goNamed("pdf_page", extra: invoice, params: {
                          "invoice_no": invoice.invoiceNo.toString()
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Image.asset(
                              "assets/pdf_icon.png",
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Expanded(child: Text("Create PDF"))
                        ],
                      )),
                ),
                Expanded(
                  child: TextButton(
                      onPressed: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(child: Icon(Icons.edit)),
                          Expanded(child: Text("Edit Invoice"))
                        ],
                      )),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
