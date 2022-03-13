import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:habllen/model/invoice_product.dart';
import 'package:habllen/shared/widgets/custom_add_field.dart';
import 'package:habllen/shared/widgets/custom_paddings.dart';
import 'package:habllen/ui/invoice_page/subpages/add_invoice_product_dialog/bloc/addinvoiceproductform_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/ui/invoice_page/subpages/add_invoiceproduct_details_page/bloc/invoice_product_detail_bloc.dart';

class AddInvoiceProductDetailsPage extends StatelessWidget {
  const AddInvoiceProductDetailsPage({Key? key}) : super(key: key);

  static String routeName = 'add_invoiceproduct_details_page';

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<InvoiceProductDetailBloc>();

    return BlocListener<InvoiceProductDetailBloc, InvoiceProductDetailState>(
      listener: (context, state) {
        context.pop();
      },
      listenWhen: (previous, current) {
        return (current.status == FormzStatus.submissionSuccess);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Product"),
          centerTitle: true,
          actions: [
            TextButton(
                onPressed: () {
                  context.read<InvoiceProductDetailBloc>().add(
                      InvoiceProductDetailEvent.saveInvoiceProductDetail());
                },
                child: Text("Save"))
          ],
        ),
        body: Column(
          children: [
            VerticalBigSpace(),
            SizedBox(
              height: 80,
              child: HorizonalPadding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name"),
                    VerticalSmallSpace(),
                    Text(bloc.state.name),
                    VerticalSmallSpace(),
                    Divider(
                      thickness: 2,
                    )
                  ],
                ),
              ),
            ),
            CustomInvoiceProductField(
              fieldName: "Price",
              initialValue: bloc.state.price.value != null
                  ? bloc.state.price.value.toString()
                  : null,
              onChanged: (price) =>
                  bloc.add(InvoiceProductDetailEvent.priceChanged(price)),
              errorText: bloc.state.price.pure ? null : bloc.state.price.error,
            ),
            CustomInvoiceProductField(
              fieldName: "Quantity",
              initialValue: (bloc.state.quantity.value != null)
                  ? bloc.state.quantity.value.toString()
                  : null,
              onChanged: (data) =>
                  bloc.add(InvoiceProductDetailEvent.quantityChanged(data)),
              errorText:
                  bloc.state.quantity.pure ? null : bloc.state.quantity.error,
            )
          ],
        ),
      ),
    );
  }
}

typedef void OnChanged(String string);

class CustomInvoiceProductField extends StatelessWidget {
  const CustomInvoiceProductField(
      {Key? key,
      required this.fieldName,
      this.initialValue,
      this.errorText,
      this.onChanged,
      this.onTap})
      : super(key: key);
  final String fieldName;
  final String? initialValue;
  final String? errorText;
  final OnChanged? onChanged;
  final OnTap? onTap;

  @override
  Widget build(BuildContext context) {
    return HorizonalPadding(
      child: ConstrainedBox(
        constraints: BoxConstraints.loose(Size.fromHeight(80)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(fieldName),
            Expanded(
              child: TextFormField(
                onChanged: onChanged,
                initialValue: initialValue,
                onTap: onTap,
                decoration: InputDecoration(
                    errorText: errorText, border: UnderlineInputBorder()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddInvoiceProductDetailsPageArguments {
  final InvoiceProduct? product;
  final AddinvoiceproductformBloc? addinvoiceproductformBloc;

  AddInvoiceProductDetailsPageArguments(
      {this.addinvoiceproductformBloc, this.product});
}
