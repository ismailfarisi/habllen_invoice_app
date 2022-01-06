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
      persistentFooterButtons: [
        SizedBox(
          height: 60,
          child: Row(children: [
            Expanded(
              child: TextButton(
                  onPressed: () {
                    context.goNamed("pdf_page",
                        extra: invoice,
                        params: {"invoice_no": invoice.invoiceNo.toString()});
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/pdf_icon.png",
                        color: Theme.of(context).primaryColor,
                      ),
                      Text("Create PDF")
                    ],
                  )),
            ),
            Expanded(
              child: TextButton(
                  onPressed: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [Icon(Icons.edit), Text("Edit Invoice")],
                  )),
            )
          ]),
        )
      ],
      body: LayoutBuilder(
        builder: (context, constraints) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Invoice",
                style: Theme.of(context).textTheme.headline4,
              ),
              Expanded(child: InvoiceViewWidget(invoice: invoice))
            ],
          ),
        ),
      ),
    );
  }
}
