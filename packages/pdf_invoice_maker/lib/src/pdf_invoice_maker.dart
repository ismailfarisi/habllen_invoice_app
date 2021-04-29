import 'dart:io';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfInvoiceMaker {
  PdfInvoiceMaker(
      this.companyName, this.companyAdd1, this.companyAdd2, this.companyGst);
  final pdf = pw.Document();

  final String companyName;
  final String companyAdd1;
  final String companyAdd2;
  final String companyGst;

  final _header = pw.MemoryImage(File('assets/1.jpg').readAsBytesSync());
  late final font1;
  void pdfPageBuilder() async {
    font1 = await rootBundle.load('assets/Roboto-Regular.ttf');
    pdf.addPage(
      pw.MultiPage(
          pageTheme: _buildTheme(PdfPageFormat.a4),
          header: _buildHeader,
          build: (pw.Context context) {
            return [
              _contentHeader(context),
            ];
          }),
    );
  }

  pw.PageTheme _buildTheme(PdfPageFormat pageFormats) {
    print('hellooooooooooo');
    return pw.PageTheme(
      pageFormat: pageFormats,
      margin: pw.EdgeInsets.only(top: 60, bottom: 30, left: 30, right: 30),
    );
  }

  pw.Widget _buildHeader(pw.Context context) {
    return pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.center, children: [
      pw.Expanded(
        child: pw.Container(height: 150, child: pw.Image(_header)),
      )
    ]);
  }

  pw.Widget _contentHeader(pw.Context context) {
    return pw.Column(
      children: [
        pw.SizedBox(height: 30),
        pw.Text('Invoice',
            style: pw.TextStyle(
                fontSize: 34,
                fontBold: pw.Font.timesBold(),
                color: PdfColor.fromHex('#283592'))),
        pw.SizedBox(height: 30),
        pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.stretch, children: [
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
            pw.Text('Invoice for',
                style:
                    pw.TextStyle(fontSize: 12, fontBold: pw.Font.timesBold())),
            pw.Text(companyName,
                style: pw.TextStyle(
                  fontSize: 11,
                )),
            pw.Text(companyAdd1, style: pw.TextStyle(fontSize: 11)),
            pw.Text(companyAdd2, style: pw.TextStyle(fontSize: 11)),
            pw.Text('GSTIN: $companyGst', style: pw.TextStyle(fontSize: 11)),
          ]),
        ]),
      ],
    );
  }

  void savePdf() async {
    final file = File('example.pdf');
    await file.writeAsBytes(await pdf.save());
  }
}
