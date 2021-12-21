import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/ui/settings_page/sub_pages/add_product_dialog/add_product_dialog.dart';

import 'package:habllen/ui/settings_page/sub_pages/products_page/cubit/productspage_cubit.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductspageCubit(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: ProductsListView(),
        floatingActionButton: FloatingActionButton(onPressed: () {
          showDialog(
              context: context,
              builder: (dialogContext) {
                return AddProductDialog();
              });
        }),
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
    final cubit = context.watch<ProductspageCubit>()..getProducts();
    return ListView.builder(
        itemCount: cubit.state.productList.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Card(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Name"),
                    Text("HSN Code"),
                    Text("Price"),
                    Text("Stock")
                  ],
                ),
              ),
            );
          }

          final product = cubit.state.productList[index - 1];
          print(product.name);
          return Card(
            child: ListTile(
              title: Text("${product.name}"),
            ),
          );
        });
  }
}
