import 'dart:io';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfInvoiceMaker {
  final pdf = pw.Document();

  final _header = pw.MemoryImage(File('assets/1.jpg').readAsBytesSync());

  void pdfPageBuilder() async {
    final font1 = await rootBundle.load('assets/Roboto-Regular.ttf');

    pdf.addPage(pw.MultiPage(
        pageTheme: _buildTheme(PdfPageFormat.a4, pw.Font.ttf(font1)),
        header: _buildHeader,
        build: (pw.Context context) {
          return [
            _contentHeader(context),
          ];
        }));
  }

  pw.PageTheme _buildTheme(PdfPageFormat pageFormat, pw.Font base) {
    return pw.PageTheme(
      pageFormat: pageFormat,
      theme: pw.ThemeData.withFont(
        base: base,
      ),
      margin: pw.EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 15),
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
    return pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
      pw.Expanded(
          child: pw.Column(
        children: [
          pw.Container(
            height: 50,
            child: pw.Text('Invoice',
                style: pw.TextStyle(
                    fontSize: 34,
                    fontBold: pw.Font.timesBold(),
                    color: PdfColor.fromHex('#283592'))),
          ),
        ],
      )),
    ]);
  }

  void savePdf() async {
    final file = File('example.pdf');
    await file.writeAsBytes(await pdf.save());
  }
}
