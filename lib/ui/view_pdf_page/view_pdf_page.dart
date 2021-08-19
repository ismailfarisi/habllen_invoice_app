import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:habllen/ui/view_pdf_page/cubit/viewpdfpath_cubit.dart';
import 'package:sales_api/model/invoice_details.dart';

class ViewPdfPage extends StatelessWidget {
  const ViewPdfPage(
    this.invoiceDetails, {
    Key? key,
  }) : super(key: key);

  final InvoiceDetails invoiceDetails;

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

  final InvoiceDetails invoiceDetails;

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
          return PDFView(
            pdfData: state.pdfData,
            swipeHorizontal: true,
          );
        }
      },
    );
  }
}