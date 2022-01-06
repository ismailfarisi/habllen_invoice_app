import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            return ProductCard(
                title: product.name,
                productCode: product.id,
                hsnCode: product.hsnCode,
                price: product.price,
                stock: product.currentStock);
          }),
    );
  }
}
