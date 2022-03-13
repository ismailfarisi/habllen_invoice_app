import 'package:flutter/material.dart';
import 'package:habllen/model/customer.dart';
import 'package:habllen/model/invoice_product.dart';
import 'package:habllen/shared/widgets/custom_add_field.dart';
import 'package:habllen/shared/widgets/custom_paddings.dart';
import 'package:habllen/shared/utils/date_util.dart';

abstract class InvoiceDetails extends StatelessWidget {
  InvoiceDetails({Key? key}) : super(key: key);

  abstract final DateTime invoiceDate;
  abstract final Duration dueDateDuration;
  abstract final Customer? company;
  abstract final List<InvoiceProduct> invoiceProductList;
  abstract final double subTotal;
  abstract final double? tax;
  abstract final bool? isIGST;

  abstract final bool modifiableMode;
  final int? invoiceNo = null;

  void onBasicInfoTapped();
  void onCustomerTap();
  void onAddProductTap();
  void onProductTap(InvoiceProduct invoiceProduct);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate.fixed([
          BasicInfo(
            invoiceNumber: invoiceNo,
            onTap: onBasicInfoTapped,
            date: invoiceDate,
            dueDateDuration: dueDateDuration,
          ),
          Divider(
            thickness: 2,
          ),
          AddCustomerTile(
            company: company,
            onTap: onCustomerTap,
          ),
          AddProductsTile(
              invoiceProductList: invoiceProductList,
              onAddTap: onAddProductTap,
              onProductTap: onProductTap,
              modifiableMode: modifiableMode),
          Divider(
            thickness: 2,
          ),
          TaxAndTotalTile(
            subTotal: subTotal,
            tax: tax,
            isIGST: isIGST,
          ),
          Divider(
            thickness: 2,
          ),
          SizedBox(
            height: 60,
          )
        ]))
      ],
    );
  }
}

class BasicInfo extends StatelessWidget {
  final DateTime date;
  final OnTap onTap;
  final int? invoiceNumber;
  final Duration dueDateDuration;

  const BasicInfo(
      {Key? key,
      required this.invoiceNumber,
      required this.date,
      required this.onTap,
      required this.dueDateDuration})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: HorizonalPadding(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  VerticalBigSpace(),
                  Text('Date : ${date.toDateString()}',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  VerticalSmallSpace(),
                  Text(
                    'Due Date : ${date.add(dueDateDuration).toDateString()}',
                  ),
                  VerticalBigSpace(),
                ],
              ),
              if (invoiceNumber != null) Text("$invoiceNumber"),
            ],
          ),
        ),
      ),
    );
  }
}

class AddCustomerTile extends StatelessWidget {
  const AddCustomerTile({Key? key, required this.company, required this.onTap})
      : super(key: key);

  final Customer? company;
  final OnTap onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAddField(
          value: company?.name,
          fieldName: "BILL TO",
          onTap: onTap,
        ),
      ],
    );
  }
}

class AddProductsTile extends StatelessWidget {
  const AddProductsTile(
      {Key? key,
      required this.invoiceProductList,
      required this.onAddTap,
      required this.onProductTap,
      required this.modifiableMode})
      : super(key: key);

  final List<InvoiceProduct> invoiceProductList;
  final OnTap onAddTap;
  final Function(InvoiceProduct) onProductTap;
  final bool modifiableMode;

  @override
  Widget build(BuildContext context) {
    return HorizonalPadding(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSmallSpace(),
            Text(
              "Products",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            VerticalSmallSpace(),
            if (invoiceProductList.isNotEmpty)
              (ListView.builder(
                shrinkWrap: true,
                itemCount: invoiceProductList.length,
                itemBuilder: (context, index) {
                  return InvoiceProductTile(
                      onTap: onProductTap,
                      invoiceProduct: invoiceProductList[index]);
                },
              )),
            if (modifiableMode)
              InkWell(
                onTap: onAddTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_circle_outline,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Add Product",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            VerticalSmallSpace(),
          ],
        ),
      ),
    );
  }
}

class InvoiceProductTile extends StatelessWidget {
  final InvoiceProduct invoiceProduct;
  final Function(InvoiceProduct) onTap;

  const InvoiceProductTile(
      {Key? key, required this.invoiceProduct, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onTap(invoiceProduct),
        contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(invoiceProduct.product.name),
                SizedBox(width: 8),
                Text(invoiceProduct.product.code.toString()),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RichText(
                    text: TextSpan(
                        text: invoiceProduct.quantity.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        children: [
                      TextSpan(
                          text: " x \u{20B9}${invoiceProduct.price}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))
                    ])),
                SizedBox(width: 8),
                Text(
                  invoiceProduct.totalPrice.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TaxAndTotalTile extends StatelessWidget {
  const TaxAndTotalTile(
      {Key? key,
      required this.subTotal,
      required double? tax,
      required this.isIGST})
      : tax = tax ?? 0.0,
        super(key: key);
  final double subTotal;
  final double tax;
  final bool? isIGST;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: HorizonalPadding(
        child: Column(children: [
          VerticalBigSpace(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Icon(Icons.settings)
            ],
          ),
          VerticalBigSpace(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("SubTotal", style: Theme.of(context).textTheme.subtitle1),
              Text("\u{20B9}${subTotal.toString()}",
                  style: Theme.of(context).textTheme.subtitle1),
            ],
          ),
          VerticalSmallSpace(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("IGST", style: Theme.of(context).textTheme.subtitle1),
              Text(
                  "\u{20B9}${(isIGST != null && isIGST!) ? tax.toString() : 0}",
                  style: Theme.of(context).textTheme.subtitle1),
            ],
          ),
          VerticalSmallSpace(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("CGST", style: Theme.of(context).textTheme.subtitle1),
              Text(
                  "\u{20B9}${(isIGST != null && !isIGST!) ? (tax).toString() : 0}",
                  style: Theme.of(context).textTheme.subtitle1),
            ],
          ),
          VerticalSmallSpace(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("SGST", style: Theme.of(context).textTheme.subtitle1),
              Text(
                  "\u{20B9}${(isIGST != null && !isIGST!) ? (tax).toString() : 0}",
                  style: Theme.of(context).textTheme.subtitle1),
            ],
          ),
          VerticalSmallSpace(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total", style: Theme.of(context).textTheme.subtitle1),
              Text("\u{20B9}${(subTotal + tax).toString()}",
                  style: Theme.of(context).textTheme.subtitle1),
            ],
          ),
          VerticalBigSpace(),
        ]),
      ),
    );
  }
}

class AdditionalNoteTile extends StatelessWidget {
  const AdditionalNoteTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
