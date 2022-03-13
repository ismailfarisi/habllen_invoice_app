import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habllen/model/product.dart';
import 'package:habllen/shared/widgets/custom_paddings.dart';
import 'package:habllen/shared/widgets/custom_progress_indicator.dart';
import 'package:habllen/shared/widgets/product_card.dart';
import 'package:habllen/ui/invoice_page/subpages/add_invoice_product_dialog/bloc/addinvoiceproductform_bloc.dart';
import 'package:habllen/shared/widgets/custom_autocomplete.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/ui/invoice_page/subpages/add_invoiceproduct_details_page/add_invoice_product_details_page.dart';
import 'package:habllen/ui/products_page/sub_pages/add_product_dialog/add_product_dialog.dart';

class AddInvoiceProductPage extends StatefulWidget {
  AddInvoiceProductPage({
    Key? key,
  }) : super(key: key);

  static const String routeName = "add_invoice_product_full_dialog";

  @override
  State<AddInvoiceProductPage> createState() => _AddInvoiceProductPageState();
}

class _AddInvoiceProductPageState extends State<AddInvoiceProductPage> {
  @override
  Widget build(BuildContext context) {
    print("add invoice product page");

    context.read<AddinvoiceproductformBloc>().add(FetchProducts());

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return BlocListener<AddinvoiceproductformBloc, AddinvoiceproductformState>(
      listener: (context, state) {
        if (state.invoiceProduct != null) {
          context.pop();
        } else if (state.product.value != null &&
            state.invoiceProduct == null) {
          final bloc = context.read<AddinvoiceproductformBloc>();
          context.pushNamed(AddInvoiceProductDetailsPage.routeName,
              extra: AddInvoiceProductDetailsPageArguments(
                  addinvoiceproductformBloc: bloc));
        }
      },
      listenWhen: (previous, current) {
        return (current.product != previous.product ||
            current.invoiceProduct != previous.invoiceProduct);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('Add Invoice Customer'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalBigSpace(),
              AddNewProductButton(),
              VerticalSmallSpace(),
              Divider(
                thickness: 2,
              ),
              VerticalSmallSpace(),
              ProductSearchField(),
              VerticalSmallSpace(),
              HorizonalPadding(
                child: Text(
                  "Recents",
                  style: textTheme.headline5?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ),
              VerticalBigSpace(),
              RescentProductsListView()
            ],
          )),
    );
  }
}

class RescentProductsListView extends StatelessWidget {
  const RescentProductsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products =
        context.watch<AddinvoiceproductformBloc>().state.productList;
    final isLoading =
        context.watch<AddinvoiceproductformBloc>().state.fetchStatus ==
            ProductFetchStatus.loading;
    return Expanded(
      child: ListView.builder(
          itemCount: isLoading ? 1 : products.length,
          itemBuilder: (context, index) {
            if (isLoading) {
              return Center(child: CustomProgressIndicator());
            }
            final item = products[index];
            return InkWell(
              onTap: () => context
                  .read<AddinvoiceproductformBloc>()
                  .add(ProductSelected(item)),
              child: ProductCard(
                  title: item.name,
                  hsnCode: item.hsnCode,
                  price: item.price,
                  stock: item.currentStock),
            );
          }),
    );
  }
}

class ProductSearchField extends StatelessWidget {
  const ProductSearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAutoComplete<Product>(
      options: context.watch<AddinvoiceproductformBloc>().state.productList,
      labelText: "product",
      displayStringForOption: (option) => option.name,
      onSelected: (option) => context
          .read<AddinvoiceproductformBloc>()
          .add(ProductSelected(option)),
    );
  }
}

class AddNewProductButton extends StatelessWidget {
  const AddNewProductButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(AddProductPage.routeName);
      },
      child: HorizonalPadding(
        child: Row(children: [
          Icon(
            Icons.add_circle_outline_outlined,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            "create new product",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ]),
      ),
    );
  }
}
