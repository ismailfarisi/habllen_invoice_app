import 'package:flutter_test/flutter_test.dart';
import 'package:pdf_invoice_maker/src/pdf_invoice_maker.dart';

void main() {
  PdfInvoiceMaker pdfInvoiceMaker;
  test('saving pdf', () {
    pdfInvoiceMaker = PdfInvoiceMaker();
    print('failed 1');
    pdfInvoiceMaker.pdfPageBuilder();
    print('failed 2');
    pdfInvoiceMaker.savePdf();
  });
}
