import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart' as pdfs;
import "package:pdf/widgets.dart" as w;
import 'package:sales_api/model/company.dart';

class PdfInvoiceMaker {
  PdfInvoiceMaker(this.company);

  final Company company;
  final pdf = w.Document();

  final _header = w.MemoryImage(File('assets/1.jpg').readAsBytesSync());

  void pdfPageBuilder() async {
    final font1 = File('assets/Roboto-Regular.ttf').readAsBytesSync();
    pdf.addPage(
      w.MultiPage(
          pageTheme: _buildTheme(pdfs.PdfPageFormat.a4,
              base: w.Font.ttf(font1.buffer.asByteData())),
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
    print('hellooooooooooo');
    return w.PageTheme(
      theme: w.ThemeData.withFont(base: base),
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
                    w.Text(company.companyName,
                        style: w.TextStyle(
                          fontSize: 10,
                        )),
                    w.Text(company.companyAdd1,
                        style: w.TextStyle(fontSize: 10)),
                    w.Text(company.companyAdd2,
                        style: w.TextStyle(fontSize: 10)),
                    w.Text('GSTIN: ${company.companyGst}',
                        style: w.TextStyle(fontSize: 10)),
                  ])),
          w.Expanded(
              flex: 1,
              child: w.Column(
                  crossAxisAlignment: w.CrossAxisAlignment.start,
                  children: [
                    w.Text('Invoice#',
                        style: w.TextStyle(
                            fontSize: 12, fontWeight: w.FontWeight.bold)),
                    w.Text('100032', style: w.TextStyle(fontSize: 10)),
                    w.SizedBox(height: 10),
                    w.Text('Dated',
                        style: w.TextStyle(
                            fontSize: 12, fontWeight: w.FontWeight.bold)),
                    w.Text('${TimeOfDay.now()}',
                        style: w.TextStyle(fontSize: 10)),
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
                  w.Text("12000"),
                  w.Text("1800"),
                  w.Text("0"),
                  w.Text("0"),
                  w.SizedBox(height: 10),
                  w.Text("13800",
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

var data = [
  ['Grey Seude', 1009, 5603, 1, 650.00, 650.00],
  ['Redel Brown	', 1008, 5903, 1, 500.00, 500.00]
];
