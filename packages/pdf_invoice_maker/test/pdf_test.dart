import 'package:flutter_test/flutter_test.dart';
import 'package:pdf_invoice_maker/src/pdf_invoice_maker.dart';

void main() {
  PdfInvoiceMaker pdfInvoiceMaker;
  test('saving pdf', () {
    TestWidgetsFlutterBinding.ensureInitialized();
    pdfInvoiceMaker = PdfInvoiceMaker(
        'Dia Retail Solutions',
        '67/8 Roopena Agrahara',
        'Hosur Road, Bngalore - 560068',
        '29CCJPS8321P1ZN');
    print('failed 1');
    pdfInvoiceMaker.pdfPageBuilder();
    print('failed 2');
    pdfInvoiceMaker.savePdf();
  });
}
