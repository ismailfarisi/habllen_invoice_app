import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/shared/pdf_invoice_maker.dart';

part 'viewpdfpath_state.dart';

class ViewpdfpathCubit extends Cubit<ViewpdfpathState> {
  ViewpdfpathCubit() : super(ViewpdfpathState());

  Future<void> getPDFData(Invoice invoiceDetails) async {
    emit(state.copywith(loading: true));
    final PdfInvoiceMaker pdfInvoiceMaker =
        PdfInvoiceMaker(invoiceDetails: invoiceDetails);
    await pdfInvoiceMaker.pdfPageBuilder();
    final pdfData = pdfInvoiceMaker.getPDFData();
    emit(state.copywith(loading: false, pdfData: pdfData));
    print(state.loading);
  }
}
