import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:habllen/model/product.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/ui/invoice_page/subpages/add_invoice_product_dialog/bloc/addinvoiceproductform_bloc.dart';
import 'package:habllen/ui/invoice_page/subpages/new_invoice_page/bloc/new_invoice_Bloc.dart';
import 'package:habllen/shared/widgets/custom_autocomplete.dart';
import 'package:habllen/shared/widgets/text_field_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/shared/utils/formz_extension.dart';

class AddProductDialog extends StatelessWidget {
  AddProductDialog({Key? key, required this.newInvoiceBloc}) : super(key: key);

  final NewInvoiceBloc newInvoiceBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddinvoiceproductformBloc(
          repository: context.read<Repository>(),
          newInvoiceBloc: newInvoiceBloc),
      child: AddProductForm(),
    );
  }
}

class AddProductForm extends StatefulWidget {
  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

typedef SelectedProduct = Product Function(Product);

class _AddProductFormState extends State<AddProductForm> {
  late final TextEditingController _productController;
  late final TextEditingController _priceController;
  final FocusNode _productFocusNode = FocusNode();
  final FocusNode _priceFocusNode = FocusNode();
  final FocusNode _quantityFocusNode = FocusNode();

  @override
  void initState() {
    _productFocusNode.addListener(_productFocusListener);
    _quantityFocusNode.onUnFocused(context, QuantityUnFocused());
    _priceFocusNode.onUnFocused(context, PriceUnFocused());
    _productController = TextEditingController();
    _priceController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _priceFocusNode.dispose();
    _productFocusNode.dispose();
    _quantityFocusNode.dispose();
    _productController.dispose();
    _priceController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddinvoiceproductformBloc, AddinvoiceproductformState>(
      listener: (context, state) {
        context.pop();
      },
      listenWhen: (previousState, currentState) =>
          currentState.status == FormzStatus.submissionSuccess,
      builder: (context, state) {
        _priceController.text = state.price.value.toString();
        return AlertDialog(
            title: Text("Add Product"),
            actions: [
              TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    context.read<AddinvoiceproductformBloc>().add(Submitted());
                  },
                  child: Text("Add"))
            ],
            content: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomAutoComplete<Product>(
                    controller: _productController,
                    focusNode: _productFocusNode,
                    textInputAction: TextInputAction.next,
                    options: state.productList,
                    labelText: "Product",
                    errorText: state.product.validation(),
                    optionState:
                        (state.fetchStatus == ProductFetchStatus.loading)
                            ? OptionState.loading
                            : OptionState.loaded,
                    displayStringForOption: (option) => option.name,
                    onSelected: (product) {
                      context
                          .read<AddinvoiceproductformBloc>()
                          .add(ProductSelected(product));
                    },
                  ),
                  CustomTextField(
                    focusNode: _priceFocusNode,
                    helperText: "Price",
                    controller: _priceController,
                    errorText: state.price.validation(),
                    keyboardType: TextInputType.numberWithOptions(),
                    textInputAction: TextInputAction.next,
                    onChanged: (price) => context
                        .read<AddinvoiceproductformBloc>()
                        .add(PriceChanged(price)),
                    onSubmitted: () {
                      _productFocusNode.nextFocus();
                    },
                  ),
                  CustomTextField(
                    focusNode: _quantityFocusNode,
                    errorText: state.quantity.validation(),
                    helperText: "Quantity",
                    onChanged: (quantity) => context
                        .read<AddinvoiceproductformBloc>()
                        .add(QuantityChanged(quantity)),
                    keyboardType: TextInputType.numberWithOptions(),
                  ),
                ],
              ),
            ));
      },
    );
  }

  void _productFocusListener() {
    if (_productFocusNode.hasFocus) {
      context.read<AddinvoiceproductformBloc>().add(ProductFocused());
    }
    if (!_productFocusNode.hasFocus) {
      context.read<AddinvoiceproductformBloc>().add(ProductUnFocused());
    }
  }
}

extension on FocusNode {
  void onUnFocused(BuildContext context, AddinvoiceproductformEvent event) {
    addListener(() {
      if (!hasFocus) {
        context.read<AddinvoiceproductformBloc>().add(event);
      }
    });
  }
}
