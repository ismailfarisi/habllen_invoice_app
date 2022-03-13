import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:habllen/model/customer.dart';
import 'package:habllen/model/invoice_product.dart';
import 'package:habllen/ui/customer_page/subpages/add_customer_dialog/add_customer_form.dart';
import 'package:habllen/ui/invoice_page/invoice_detail_bloc/invoice_detail_bloc.dart';
import 'package:habllen/ui/invoice_page/invoice_details.dart';
import 'package:habllen/ui/invoice_page/subpages/add_basic_info/add_basic_info.dart';
import 'package:habllen/ui/invoice_page/subpages/add_invoice_customer_page/add_invoice_customer_page.dart';
import 'package:habllen/ui/invoice_page/subpages/add_invoice_product_dialog/add_invoice_product_dialog.dart';
import 'package:habllen/ui/invoice_page/subpages/new_invoice_page/bloc/new_invoice_Bloc.dart';
import 'package:habllen/ui/products_page/sub_pages/add_product_dialog/add_product_dialog.dart';
import 'package:loader_overlay/loader_overlay.dart';

const int BASIC_INFO_STEP = 0;
const int PRODUCT_ENTRY_STEP = 1;

class NewInvoicePage extends StatefulWidget {
  const NewInvoicePage({Key? key}) : super(key: key);

  static const String routeName = "new_invoice_page";

  @override
  State<NewInvoicePage> createState() => _NewInvoicePageState();
}

class _NewInvoicePageState extends State<NewInvoicePage> {
  Customer? company;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: BlocListener<NewInvoiceBloc, NewInvoiceState>(
        listener: (context, state) {
          if (context.loaderOverlay.visible) {
            context.loaderOverlay.hide();
          }
          context.pop();
        },
        listenWhen: (previous, current) =>
            current.createInvoiceStatus == Status.success,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Invoice",
            ),
            centerTitle: true,
            actions: [SaveButton()],
          ),
          body: NewInvoiceBody(context),
        ),
      ),
    );
  }
}

Future<bool> _onWillPop(BuildContext context) async {
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

class SaveButton extends StatelessWidget {
  const SaveButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          _onSavePressed(context);
        },
        child: Text("Save"));
  }

  void _onSavePressed(BuildContext context) {
    final bloc = context.read<InvoiceDetailBloc>();
    if (bloc.state.inputInvoice.value.company == null) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: SizedBox(
            height: 25,
            child: Center(
              child: Text(
                "CUSTOMER REQUIRED",
              ),
            ),
          ),
          behavior: SnackBarBehavior.floating,
        ));
    } else if (bloc.state.inputInvoice.value.products.isEmpty) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: SizedBox(
            height: 25,
            child: Center(
              child: Text(
                "ITEM REQUIRED",
              ),
            ),
          ),
          behavior: SnackBarBehavior.floating,
        ));
    } else {
      if (bloc.state.invoiceStatus == FormzStatus.valid) {
        context.loaderOverlay.show();
        context
            .read<NewInvoiceBloc>()
            .add(CreateInvoice(bloc.state.inputInvoice.value));
      }
    }
  }
}

class NewInvoiceBody extends InvoiceDetails {
  final BuildContext context;
  final InvoiceDetailBloc bloc;

  NewInvoiceBody(this.context) : bloc = context.watch<InvoiceDetailBloc>();

  @override
  bool get modifiableMode => true;

  @override
  Customer? get company => bloc.state.inputInvoice.value.company;

  @override
  Duration get dueDateDuration => Duration(days: 7);

  @override
  DateTime get invoiceDate =>
      bloc.state.inputInvoice.value.date ?? DateTime.now();

  @override
  List<InvoiceProduct> get invoiceProductList =>
      bloc.state.inputInvoice.value.products;

  @override
  void onAddProductTap() {
    context.pushNamed(AddInvoiceProductPage.routeName, extra: bloc);
  }

  @override
  void onBasicInfoTapped() {
    context.pushNamed(AddBasicInfoPage.routeName, extra: bloc);
  }

  @override
  void onCustomerTap() {
    if (company == null) {
      context.pushNamed(AddInvoiceCustomerPage.routeName, extra: bloc);
    }
    if (company != null) {
      context.pushNamed(
        AddCustomerPage.routeName,
        extra: AddCustomerPageArguments(customer: company),
      );
    }
  }

  @override
  void onProductTap(InvoiceProduct invoiceProduct) {
    context.pushNamed(
      AddProductPage.routeName,
    );
  }

  @override
  double get subTotal => bloc.state.inputInvoice.value.price ?? 0;

  @override
  bool? get isIGST => bloc.state.inputInvoice.value.isIgst;

  @override
  double? get tax => bloc.state.inputInvoice.value.tax;
}
