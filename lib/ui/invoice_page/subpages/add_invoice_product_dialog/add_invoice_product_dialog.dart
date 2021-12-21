import 'package:flutter/material.dart';
import 'package:habllen/model/invoice_product.dart';
import 'package:habllen/model/product.dart';
import 'package:habllen/ui/invoice_page/subpages/new_invoice_page/cubit/new_invoice_Bloc.dart';
import 'package:habllen/shared/widgets/custom_autocomplete.dart';
import 'package:habllen/shared/widgets/text_field_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductDialog extends StatefulWidget {
  AddProductDialog({
    Key? key,
    required this.dialogContext,
    required this.parentContext,
  }) : super(key: key);

  final BuildContext dialogContext;
  final BuildContext parentContext;
  late final Product? product;

  @override
  State<AddProductDialog> createState() => _AddProductDialogState();
}

typedef SelectedProduct = Product Function(Product);

class _AddProductDialogState extends State<AddProductDialog> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  late final TextEditingController _priceController;
  late final TextEditingController _quantityController;
  late final NewInvoiceBloc bloc;
  late final FocusNode _productFocusNode;
  late final FocusNode _priceFocusNode;

  @override
  void initState() {
    _productFocusNode = FocusNode();
    _priceFocusNode = FocusNode();
    _priceController = TextEditingController();
    _quantityController = TextEditingController();
    super.initState();
    bloc = context.read()..add(FetchProducts());
  }

  @override
  void dispose() {
    _priceFocusNode.dispose();
    _priceFocusNode.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewInvoiceBloc, ScreenStage>(
      listener: (context, state) {
        Navigator.pop(context);
      },
      listenWhen: (previousState, currentState) {
        return (currentState.invoiceProductList.length ==
            previousState.invoiceProductList.length + 1);
      },
      bloc: bloc,
      builder: (context, state) {
        List<Product> _productList = state.productList;
        return AlertDialog(
            title: Text("Add Product"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    assert(widget.product != null, "product null");
                    if (widget.product != null) {
                      final InvoiceProduct invoiceProduct = InvoiceProduct(
                          product: widget.product!,
                          price: double?.parse(_priceController.text),
                          quantity: double.parse(_quantityController.text));
                      print(invoiceProduct);
                      bloc.add(ProductAddedToInvoice(
                          invoiceProduct: invoiceProduct));
                    }
                  },
                  child: Text("Add"))
            ],
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomAutoComplete<Product>(
                    focusNode: _productFocusNode,
                    textInputAction: TextInputAction.next,
                    options: _productList,
                    labelText: "Product",
                    displayStringForOption: (option) => option.name,
                    onSelected: (product) {
                      widget.product = product;
                      _priceController.text = product.price.toString();
                      _priceFocusNode.nextFocus();
                    },
                  ),
                  CustomTextField(
                    validator: (value) {},
                    focusNode: _priceFocusNode,
                    controller: _priceController,
                    helperText: "Price",
                    keyboardType: TextInputType.numberWithOptions(),
                    textInputAction: TextInputAction.next,
                    onSubmitted: () {
                      _productFocusNode.nextFocus();
                    },
                  ),
                  CustomTextField(
                    validator: (value) {
                      if (value != null) {
                        final doubleValue = double.parse(value);
                        if (doubleValue != 0 &&
                            doubleValue <= widget.product!.currentStock) {
                          return null;
                        }
                        return "Available stock is only ${widget.product}";
                      }
                      return "Enter a valid value";
                    },
                    controller: _quantityController,
                    helperText: "Quantity",
                    keyboardType: TextInputType.numberWithOptions(),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
