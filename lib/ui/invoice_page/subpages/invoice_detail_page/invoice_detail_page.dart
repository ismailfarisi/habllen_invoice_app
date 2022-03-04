import 'dart:async';

import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/model/invoice_product.dart';
import 'package:habllen/shared/widgets/icon_text_button.dart';
import 'package:habllen/ui/customer_page/subpages/add_customer_dialog/add_customer_form.dart';
import 'package:habllen/ui/invoice_page/invoice_detail_bloc/invoice_detail_bloc.dart';

import 'package:habllen/ui/invoice_page/invoice_details.dart';
import 'package:habllen/ui/invoice_page/subpages/add_basic_info/add_basic_info.dart';

import 'package:habllen/ui/invoice_page/subpages/add_invoice_product_dialog/add_invoice_product_dialog.dart';
import 'package:habllen/ui/invoice_page/subpages/add_invoiceproduct_details_page/add_invoice_product_details_page.dart';
import 'package:habllen/ui/invoice_page/subpages/invoice_detail_page/bloc/invoicedetailpage_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/ui/invoice_page/subpages/view_pdf_page/view_pdf_page.dart';
import 'package:loader_overlay/loader_overlay.dart';

class InvoiceDetailPage extends StatelessWidget {
  const InvoiceDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isEditableMode =
        context.watch<InvoicedetailpageBloc>().state.isEditableMode;
    if (!isEditableMode) {
      if (context.loaderOverlay.visible) {
        context.loaderOverlay.hide();
      }
    }
    return WillPopScope(
      onWillPop: () {
        return _onWillPop(isEditableMode, context);
      },
      child: Scaffold(
          appBar: AppBar(
            actions: [
              if (isEditableMode)
                TextButton(
                  child: Text("Save"),
                  onPressed: () {
                    final invoiceDetailBloc = context.read<InvoiceDetailBloc>();
                    if (invoiceDetailBloc.state.invoiceStatus ==
                        FormzStatus.valid) {
                      context.loaderOverlay.show();
                      final invoice =
                          invoiceDetailBloc.state.inputInvoice.value;

                      context
                          .read<InvoicedetailpageBloc>()
                          .add(UpdateInvoice(invoice: invoice));
                    } else {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                          content: Text("Invoice is not valid"),
                        ));
                    }
                  },
                )
            ],
          ),
          body: Stack(
            children: [
              ProviderContext(),
              if (!isEditableMode) BottomBar(),
            ],
          )),
    );
  }

  Future<bool> _onWillPop(bool isEditableMode, BuildContext context) async {
    if (!isEditableMode) {
      return true;
    } else {
      return await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(
                    "Are you sure you want to leave without saving?",
                    maxLines: 2,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text("Cancel")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text("Yes")),
                  ],
                );
              }) ??
          false;
    }
  }
}

class ProviderContext extends StatelessWidget {
  const ProviderContext({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InvoiceDetailBody(context);
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).primaryColor, width: 2),
                color: Colors.lightGreen[200]),
            height: 62,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconTextButton(
                    icon: Icon(Icons.preview_rounded),
                    text: Text("Preview"),
                    onTap: () {
                      final invoice = context
                          .read<InvoiceDetailBloc>()
                          .state
                          .inputInvoice
                          .value;
                      context.pushNamed(ViewPdfPage.routeName, extra: invoice);
                    }),
                IconTextButton(
                    icon: Icon(Icons.edit),
                    text: Text("Edit"),
                    onTap: () {
                      context
                          .read<InvoicedetailpageBloc>()
                          .add(EditModeChanged(isEditMode: true));
                    }),
                IconTextButton(
                    icon: Icon(Icons.share), text: Text("Share"), onTap: () {}),
                IconTextButton(
                    icon: Icon(Icons.more_horiz),
                    text: Text("More"),
                    onTap: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InvoiceDetailBody extends InvoiceDetails {
  final BuildContext context;
  final Invoice invoice;
  final bool isEditableMode;

  InvoiceDetailBody(this.context)
      : invoice = context.watch<InvoiceDetailBloc>().state.inputInvoice.value,
        isEditableMode =
            context.watch<InvoicedetailpageBloc>().state.isEditableMode;

  @override
  int? get invoiceNo => invoice.invoiceNo;

  @override
  bool get modifiableMode => isEditableMode;

  @override
  Customer? get company => invoice.company;

  @override
  Duration get dueDateDuration => Duration(days: 7);

  @override
  DateTime get invoiceDate => invoice.date!;

  @override
  List<InvoiceProduct> get invoiceProductList => invoice.products;

  @override
  void onAddProductTap() {
    if (isEditableMode) {
      context.pushNamed(AddInvoiceProductPage.routeName,
          extra: context.read<InvoiceDetailBloc>());
    }
  }

  @override
  void onBasicInfoTapped() {
    if (isEditableMode) {
      context.pushNamed(AddBasicInfoPage.routeName,
          extra: context.read<InvoiceDetailBloc>());
    }
  }

  @override
  void onCustomerTap() {
    if (isEditableMode) {
      context.pushNamed(AddCustomerPage.routeName,
          extra: AddCustomerPageArguments(customer: company));
    }
  }

  @override
  void onProductTap(InvoiceProduct invoiceProduct) {
    if (isEditableMode) {
      context.pushNamed(AddInvoiceProductDetailsPage.routeName,
          extra: invoiceProduct);
    }
  }

  @override
  double get subTotal => invoice.totalPrice!;

  @override
  bool? get isIGST => invoice.isIgst;

  @override
  double? get tax => invoice.tax;
}
