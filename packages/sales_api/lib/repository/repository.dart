import 'package:sales_api/model/company.dart';

import '../pdf_creator/pdf_invoice_maker.dart';

void createPdf(Company company) {
  final Company companyObject = company;
  try {
    PdfInvoiceMaker pdfInvoiceMaker = PdfInvoiceMaker(companyObject);
    pdfInvoiceMaker.pdfPageBuilder();
    pdfInvoiceMaker.savePdf();
  } on Exception catch (e) {
    // TODO
  }
}
