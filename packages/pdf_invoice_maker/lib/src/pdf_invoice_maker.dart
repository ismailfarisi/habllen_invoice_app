import 'dart:io';

import 'package:pdf/pdf.dart'as pdfs;
import 'package:pdf/widgets.dart' as w ;

class PdfInvoiceMaker {
  PdfInvoiceMaker(
      this.companyName, this.companyAdd1, this.companyAdd2, this.companyGst);
  final pdf = w.Document();

  final String companyName;
  final String companyAdd1;
  final String companyAdd2;
  final String companyGst;

  final _header = w.MemoryImage(File('assets/1.jpg').readAsBytesSync());
  //late final font1;
  void pdfPageBuilder() async {
    //font1 = await rootBundle.load('assets/Roboto-Regular.ttf');
    pdf.addPage(
      w.MultiPage(
          pageTheme: _buildTheme(pdfs.PdfPageFormat.a4),
          header: _buildHeader,
          build: (w.Context context) {
            return [
              _contentHeader(context),
            ];
          }),
    );
  }

  w.PageTheme _buildTheme(pdfs.PdfPageFormat pageFormats) {
    print('hellooooooooooo');
    return w.PageTheme(
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
      children: [
        w.SizedBox(height: 30),
        w.Text('Invoice',
            style: w.TextStyle(
                fontSize: 34,
                fontWeight: w.FontWeight.bold,
                color: pdfs.PdfColor.fromHex('#283592'))),
        w.SizedBox(height: 30),
        w.Row(crossAxisAlignment: w.CrossAxisAlignment.stretch, children: [
          w.Column(crossAxisAlignment: w.CrossAxisAlignment.start, children: [
            w.Text('Invoice for',
                style:
                    w.TextStyle(fontSize: 12, fontWeight:w.FontWeight.bold)),
            w.Text(companyName,
                style: w.TextStyle(
                  fontSize: 11,
                )),
            w.Text(companyAdd1, style: w.TextStyle(fontSize: 11)),
            w.Text(companyAdd2, style: w.TextStyle(fontSize: 11)),
            w.Text('GSTIN: $companyGst', style: w.TextStyle(fontSize: 11)),
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
