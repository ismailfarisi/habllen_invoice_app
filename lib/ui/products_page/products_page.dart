import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:habllen/model/product.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/shared/widgets/product_card.dart';
import 'package:habllen/ui/products_page/bloc/productspage_bloc.dart';
import 'package:habllen/ui/products_page/sub_pages/add_product_dialog/add_product_dialog.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductspageBloc(repository: context.read<Repository>()),
      child: BodyScaffold(),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(onRefresh: () async {}, child: ProductsListView()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(AddProductPage.routeName,
              extra: AddProductPageArguments(
                  productspageBloc: context.read<ProductspageBloc>()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ProductsListView extends StatefulWidget {
  const ProductsListView({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductsListView> createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  late final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<ProductspageBloc>().add(FetchProducts());
    return BlocBuilder<ProductspageBloc, ProductspageState>(
      builder: (context, state) => ListView.builder(
          itemCount: (state.hasReachedMax)
              ? state.productList.length
              : state.productList.length + 1,
          itemBuilder: (context, index) {
            return (index >= state.productList.length)
                ? Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                  )
                : ProductTile(product: state.productList[index], index: index);
          }),
    );
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<ProductspageBloc>().add(LoadMore());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
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
            onPressed: (context) {
              context.pushNamed(AddProductPage.routeName,
                  extra: AddProductPageArguments(
                      productspageBloc: context.read<ProductspageBloc>(),
                      product: product));
            },
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
  }
}
