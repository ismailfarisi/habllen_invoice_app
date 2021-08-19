import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sales_api/model/company.dart';
import 'package:sales_api/model/invoice_details.dart';
import 'package:sales_api/pdf_creator/pdf_invoice_maker.dart';

class MockInvoiceDetails extends Mock implements InvoiceDetails {}

void main() {
  PdfInvoiceMaker pdfInvoiceMaker;
  test('saving pdf', () {
    TestWidgetsFlutterBinding.ensureInitialized();
    pdfInvoiceMaker = PdfInvoiceMaker(InvoiceDetails(
        100001,
        Company(
            companyName: "Aishwarya",
            companyAdd1: "paaaala",
            companyAdd2: "coimbatore",
            companyGst: "663633"),
        [],
        "29/5/2012",
        22.5,
        ""));
    print('failed 1');
    pdfInvoiceMaker.pdfPageBuilder();
    print('failed 2');
    pdfInvoiceMaker.savePdf();
  });
}
