import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

import 'package:habllen/model/company.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/model/invoice_product.dart';
import 'package:habllen/shared/widgets/date_util.dart';
import 'package:pdf/pdf.dart' as pdfs;
import "package:pdf/widgets.dart" as w;

class PdfInvoiceMaker {
  PdfInvoiceMaker({required this.invoiceDetails})
      : company = invoiceDetails.company;

  final Invoice invoiceDetails;
  late final Company company;
  late final String companyName = company.name;
  late final String companyAdd1 = company.addressOne;
  late final String? companyAdd2 = company.addressTwo;
  late final String companyGst = company.gst;
  late final List<InvoiceProduct> invoiceProducts = invoiceDetails.product;
  late final data = invoiceProducts
      .map((e) => [
            e.product.name,
            e.product.id,
            e.product.hsnCode,
            e.quantity,
            e.price,
            e.totalPrice
          ])
      .toList();
  final pdf = w.Document();
  dynamic _header;

  Future<void> pdfPageBuilder() async {
    _header = w.MemoryImage(
        (await rootBundle.load('assets/1.jpg')).buffer.asUint8List());
    final font = w.Font.ttf(await rootBundle.load("assets/Roboto-Regular.ttf"));

    pdf.addPage(
      w.MultiPage(
          pageTheme: _buildTheme(pdfs.PdfPageFormat.a4, base: font),
          header: _buildHeader,
          build: (w.Context context) {
            return [
              _contentHeader(context),
              _contentTable(context),
              w.SizedBox(height: 20),
              _contentTotalPrice(context),
              w.Divider(borderStyle: w.BorderStyle.solid, thickness: 0.5),
              _contentPayment(context),
            ];
          }),
    );
  }

  w.PageTheme _buildTheme(pdfs.PdfPageFormat pageFormats, {w.Font? base}) {
    return w.PageTheme(
      theme: w.ThemeData.withFont(base: base, bold: base),
      pageFormat: pageFormats,
      margin: w.EdgeInsets.only(top: 60, bottom: 30, left: 30, right: 30),
    );
  }

  w.Widget _buildHeader(w.Context context) {
    return w.Row(crossAxisAlignment: w.CrossAxisAlignment.center, children: [
      w.Expanded(
        child: w.Container(height: 150, child: w.Image(_header)),
      )
    ]);
  }

  w.Widget _contentHeader(w.Context context) {
    return w.Column(
      crossAxisAlignment: w.CrossAxisAlignment.start,
      children: [
        w.SizedBox(height: 30),
        w.Text('Invoice',
            style: w.TextStyle(
                fontSize: 34,
                fontWeight: w.FontWeight.bold,
                color: pdfs.PdfColor.fromHex('#283592'))),
        w.SizedBox(height: 30),
        w.Row(crossAxisAlignment: w.CrossAxisAlignment.start, children: [
          w.Expanded(
              flex: 2,
              child: w.Column(
                  crossAxisAlignment: w.CrossAxisAlignment.start,
                  children: [
                    w.Text('Invoice for',
                        style: w.TextStyle(
                            fontSize: 12, fontWeight: w.FontWeight.bold)),
                    w.Text('$companyName',
                        style: w.TextStyle(
                          fontSize: 10,
                        )),
                    w.Text('$companyAdd1', style: w.TextStyle(fontSize: 10)),
                    w.Text('$companyAdd2', style: w.TextStyle(fontSize: 10)),
                    w.Text('GSTIN: $companyGst',
                        style: w.TextStyle(fontSize: 10)),
                  ])),
          w.Expanded(
              flex: 1,
              child: w.Column(
                  crossAxisAlignment: w.CrossAxisAlignment.start,
                  children: [
                    w.Text('Invoice#: ${invoiceDetails.invoiceNo}',
                        style: w.TextStyle(fontSize: 10)),
                    w.SizedBox(height: 10),
                    w.Text('Date: ${invoiceDetails.date.toDateString()}',
                        style: w.TextStyle(
                            fontSize: 12, fontWeight: w.FontWeight.bold)),
                  ]))
        ]),
        w.Divider(borderStyle: w.BorderStyle.solid, thickness: 0.5)
      ],
    );
  }

  void savePdf() async {
    final file = File('example.pdf');
    await file.writeAsBytes(await pdf.save());
  }

  Future<Uint8List> getPDFData() async {
    return await pdf.save();
  }

  _contentTable(w.Context context) {
    return w.Table.fromTextArray(
        headers: [
          'Description',
          'Item No.',
          'HSN No.',
          'Qty in mtrs',
          'Unit price',
          'Total price'
        ],
        data: data,
        cellPadding: w.EdgeInsets.only(top: 5),
        cellAlignments: {5: w.Alignment.topRight},
        headerStyle: w.TextStyle(
            color: pdfs.PdfColor.fromHex('#283592'),
            fontWeight: w.FontWeight.bold),
        headerAlignment: w.Alignment.centerLeft,
        oddRowDecoration:
            w.BoxDecoration(color: pdfs.PdfColor.fromHex('#f3f3f3')),
        border: w.TableBorder.all(width: 0.0, style: w.BorderStyle.none));
  }

  _contentTotalPrice(w.Context context) {
    return w.Row(crossAxisAlignment: w.CrossAxisAlignment.start, children: [
      w.Expanded(
          flex: 4,
          child: w.Column(
              crossAxisAlignment: w.CrossAxisAlignment.start,
              children: [
                w.Text("notes:-"),
              ])),
      w.Expanded(
          flex: 1,
          child: w.Column(
              crossAxisAlignment: w.CrossAxisAlignment.start,
              children: [
                w.Text("Subtotal",
                    style:
                        w.TextStyle(color: pdfs.PdfColor.fromHex('#283592'))),
                w.Text("IGST-12%",
                    style:
                        w.TextStyle(color: pdfs.PdfColor.fromHex('#283592'))),
                w.Text("CGST-6%",
                    style:
                        w.TextStyle(color: pdfs.PdfColor.fromHex('#283592'))),
                w.Text("SGST-6%",
                    style: w.TextStyle(color: pdfs.PdfColor.fromHex('#283592')))
              ])),
      w.Expanded(
        flex: 1,
        child: w.Padding(
            padding: w.EdgeInsets.only(right: 5.0),
            child: w.Column(
                crossAxisAlignment: w.CrossAxisAlignment.end,
                children: [
                  w.Text("${invoiceDetails.price}"),
                  w.Text("${invoiceDetails.iGST}"),
                  w.Text("${invoiceDetails.cGST}"),
                  w.Text("${invoiceDetails.sGST}"),
                  w.SizedBox(height: 10),
                  w.Text("${invoiceDetails.totalPrice}",
                      style: w.TextStyle(
                          fontWeight: w.FontWeight.bold, fontSize: 17))
                ])),
      )
    ]);
  }

  _contentPayment(w.Context context) {
    return w.Column(crossAxisAlignment: w.CrossAxisAlignment.start, children: [
      w.Text("Company's Bank Details"),
      w.SizedBox(height: 10),
      w.Row(children: [
        w.Expanded(
            flex: 1,
            child: w.Column(
                crossAxisAlignment: w.CrossAxisAlignment.start,
                children: [
                  w.Text("Bank Name ", style: w.TextStyle(fontSize: 10)),
                  w.Text("A/c No.", style: w.TextStyle(fontSize: 10)),
                  w.Text("Branch & IFSC Code",
                      style: w.TextStyle(fontSize: 10)),
                ])),
        w.Expanded(
            flex: 3,
            child: w.Column(
                crossAxisAlignment: w.CrossAxisAlignment.start,
                children: [
                  w.Text(": UNION BANK OF INDIA",
                      style: w.TextStyle(fontSize: 10)),
                  w.Text(": 551101010050111", style: w.TextStyle(fontSize: 10)),
                  w.Text(": Mullassery - UBIN0555118",
                      style: w.TextStyle(fontSize: 10)),
                ])),
        w.Expanded(
            flex: 2,
            child: w.Column(
                crossAxisAlignment: w.CrossAxisAlignment.start,
                mainAxisAlignment: w.MainAxisAlignment.end,
                children: [
                  w.Text("For Habllen Enterprises"),
                  w.Text("(Authorised Signature)",
                      style: w.TextStyle(fontSize: 10))
                ])),
      ])
    ]);
  }
}
