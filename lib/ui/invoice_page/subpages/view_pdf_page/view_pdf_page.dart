import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/model/invoice.dart';
import 'package:printing/printing.dart';

import 'cubit/viewpdfpath_cubit.dart';

class ViewPdfPage extends StatelessWidget {
  const ViewPdfPage(
    this.invoiceDetails, {
    Key? key,
  }) : super(key: key);

  final Invoice invoiceDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => ViewpdfpathCubit(),
        child: MyPDFView(invoiceDetails),
      ),
    );
  }
}

class MyPDFView extends StatelessWidget {
  const MyPDFView(
    this.invoiceDetails, {
    Key? key,
  }) : super(key: key);

  final Invoice invoiceDetails;

  @override
  Widget build(BuildContext context) {
    context.read<ViewpdfpathCubit>()..getPDFData(invoiceDetails);
    return BlocBuilder<ViewpdfpathCubit, ViewpdfpathState>(
      builder: (context, state) {
        if (state.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return PdfPreview(
            build: (format) => state.pdfData!,
            canChangeOrientation: false,
            canChangePageFormat: false,
            canDebug: false,
          );
        }
      },
    );
  }
}
