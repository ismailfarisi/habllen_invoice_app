import 'package:flutter_test/flutter_test.dart';
import 'package:pdf_invoice_maker/src/pdf_invoice_maker.dart';

void main() {
  PdfInvoiceMaker pdfInvoiceMaker;
  test('saving pdf', () {
    pdfInvoiceMaker = PdfInvoiceMaker();
    pdfInvoiceMaker.pdfPageBuilder();
    pdfInvoiceMaker.savePdf();
  });
}
