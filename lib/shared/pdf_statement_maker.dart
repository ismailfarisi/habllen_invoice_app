import 'dart:io';
import 'dart:typed_data';
import 'package:collection/src/list_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:habllen/model/statement.dart';
import 'package:habllen/shared/utils/date_util.dart';
import 'package:habllen/model/customer.dart';
import 'package:pdf/pdf.dart' as pdfs;
import 'package:pdf/widgets.dart' as w;

class PdfStatementMaker {
  PdfStatementMaker({required this.statementList, required this.customer})
      : customerName = customer.name,
        customerAddress1 = customer.addressOne,
        customerAddress2 = customer.addressTwo,
        customerGst = customer.gst;
  final List<Statement> statementList;
  final Customer customer;
  final String customerName;
  final String customerAddress1;
  final String? customerAddress2;
  final String customerGst;
  late final data = statementList.mapIndexed((index, statement) {
    return [
      index + 1,
      statement.description,
      statement.date.toDateString(),
      statement.debit.toString(),
      statement.credit.toString(),
      statement.balance.toString(),
    ];
  }).toList();

  final pdf = w.Document();
  late w.MemoryImage _header;
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
              _contentTotalDue(context),
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
        w.Text('Statement',
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
                    w.Text('$customerName',
                        style: w.TextStyle(
                          fontSize: 10,
                        )),
                    w.Text('$customerAddress1',
                        style: w.TextStyle(fontSize: 10)),
                    w.Text('$customerAddress2',
                        style: w.TextStyle(fontSize: 10)),
                    w.Text('GSTIN: $customerGst',
                        style: w.TextStyle(fontSize: 10)),
                  ])),
          w.Expanded(
              flex: 1,
              child: w.Column(
                  crossAxisAlignment: w.CrossAxisAlignment.start,
                  children: [
                    w.SizedBox(height: 10),
                    w.Text('Date: ${DateTime.now().toDateString()}',
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
    final data = await pdf.save();
    return data;
  }

  _contentTable(w.Context context) {
    return w.Table.fromTextArray(
        headers: [
          'Si. no.',
          'Description',
          "Date",
          'Debit',
          'Credit',
          'Balance',
        ],
        data: data,
        cellPadding: w.EdgeInsets.only(top: 5),
        cellAlignments: {
          5: w.Alignment.centerRight,
          0: w.Alignment.center,
          2: w.Alignment.center,
          3: w.Alignment.center,
          4: w.Alignment.center,
          1: w.Alignment.center
        },
        headerStyle: w.TextStyle(
            color: pdfs.PdfColor.fromHex('#283592'),
            fontWeight: w.FontWeight.bold),
        headerAlignment: w.Alignment.center,
        oddRowDecoration:
            w.BoxDecoration(color: pdfs.PdfColor.fromHex('#f3f3f3')),
        border: w.TableBorder.all(width: 0.0, style: w.BorderStyle.none));
  }

  _contentTotalDue(w.Context context) {
    return w.Row(mainAxisAlignment: w.MainAxisAlignment.end, children: [
      w.Text("Total Due : ",
          style: w.TextStyle(
              fontSize: 16,
              fontWeight: w.FontWeight.bold,
              color: pdfs.PdfColor.fromHex('#283592'))),
      w.Text("${statementList.last.balance}",
          style: w.TextStyle(
              fontSize: 18,
              fontWeight: w.FontWeight.bold,
              color: pdfs.PdfColor.fromHex('#283592'))),
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
