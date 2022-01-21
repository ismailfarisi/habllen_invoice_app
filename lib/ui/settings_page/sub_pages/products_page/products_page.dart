import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/shared/widgets/product_card.dart';
import 'package:habllen/ui/settings_page/sub_pages/add_product_dialog/add_product_dialog.dart';
import 'package:habllen/ui/settings_page/sub_pages/products_page/bloc/productspage_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductspageBloc(repository: context.read<Repository>()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: ProductsListView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (dialogContext) {
                  return AddProductDialog();
                });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class ProductsListView extends StatelessWidget {
  const ProductsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ProductspageBloc>().add(FetchProducts());
    return BlocBuilder<ProductspageBloc, ProductspageState>(
      builder: (context, state) => ListView.builder(
          itemCount: state.productList.length,
          itemBuilder: (context, index) {
            final product = state.productList[index];
            print(product.name);
            return Slidable(
                endActionPane:
                    ActionPane(motion: const StretchMotion(), children: [
                  SlidableAction(
                    onPressed: (context) {
                      context
                          .read<ProductspageBloc>()
                          .add(DeleteProduct(product: product, index: index));
                    },
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: 'Edit',
                  ),
                ]),
                child: ProductCard(
                    title: product.name,
                    productCode: product.code,
                    hsnCode: product.hsnCode,
                    price: product.price,
                    stock: product.currentStock));
          }),
    );
  }
}
