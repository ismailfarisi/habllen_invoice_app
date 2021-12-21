import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/shared/pdf_invoice_maker.dart';
import 'package:path_provider/path_provider.dart';

part 'viewpdfpath_state.dart';

class ViewpdfpathCubit extends Cubit<ViewpdfpathState> {
  ViewpdfpathCubit() : super(ViewpdfpathState());

  Future<void> getDirectoryPath() async {
    Directory? directory = await getExternalStorageDirectory();
    String path = directory!.path;
    emit(state.copywith(path: path));
  }

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
