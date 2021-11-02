import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sales_api/model/invoice_details.dart';
import 'package:sales_api/pdf_creator/pdf_invoice_maker.dart';

part 'viewpdfpath_state.dart';

class ViewpdfpathCubit extends Cubit<ViewpdfpathState> {
  ViewpdfpathCubit() : super(ViewpdfpathState());

  Future<void> getDirectoryPath() async {
    Directory? directory = await getExternalStorageDirectory();
    String path = directory!.path;
    emit(state.copywith(path: path));
  }

  Future<void> getPDFData(InvoiceDetails invoiceDetails) async {
    emit(state.copywith(loading: true));
    final PdfInvoiceMaker pdfInvoiceMaker = PdfInvoiceMaker(invoiceDetails);
    await pdfInvoiceMaker.pdfPageBuilder();
    final pdfData = pdfInvoiceMaker.getPDFData();
    emit(state.copywith(loading: false, pdfData: pdfData));
    print(state.loading);
  }
}
