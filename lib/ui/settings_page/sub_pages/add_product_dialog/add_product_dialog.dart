import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:habllen/repository/repository.dart';
import 'package:habllen/ui/settings_page/sub_pages/add_product_dialog/bloc/addproductform_bloc.dart';
import 'package:habllen/shared/widgets/text_field_widget.dart';
import 'package:habllen/shared/utils/formz_extension.dart';

class AddProductDialog extends StatelessWidget {
  const AddProductDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            AddProductFormBloc(repository: context.read<Repository>()),
        child: AddProductForm());
  }
}

class AddProductForm extends StatefulWidget {
  const AddProductForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final FocusNode _priceFocusNode = FocusNode();
  final _nameFocusNode = FocusNode();
  final _hsnFocusNode = FocusNode();
  final _stockFocusNode = FocusNode();
  final _idFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _priceFocusNode.onUnFocused<AddProductFormBloc>(context, PriceUnFocused());
    _hsnFocusNode.onUnFocused<AddProductFormBloc>(context, HsnCodeUnFocused());
    _nameFocusNode.onUnFocused<AddProductFormBloc>(
        context, ProductNameUnFocused());
    _idFocusNode.onUnFocused<AddProductFormBloc>(
        context, ProductCodeUnFocused());
    _stockFocusNode.onUnFocused<AddProductFormBloc>(context, StockUnFocused());
  }

  @override
  void dispose() {
    _priceFocusNode.dispose();
    _hsnFocusNode.dispose();
    _nameFocusNode.dispose();
    _idFocusNode.dispose();
    _stockFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductFormBloc, AddProductFormState>(
      listener: (context, state) {
        Navigator.pop(context);
      },
      listenWhen: (previous, current) =>
          current.status == FormzStatus.submissionSuccess,
      builder: (context, state) {
        return AlertDialog(
          title: Text("Add New Product"),
          actions: (state.status == FormzStatus.submissionInProgress)
              ? []
              : [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel")),
                  ElevatedButton(
                      onPressed: () {
                        context.read().addProduct();
                      },
                      child: Text("Add"))
                ],
          content: (state.status == FormzStatus.submissionInProgress)
              ? SizedBox(
                  height: 60, width: 60, child: CircularProgressIndicator())
              : Form(
                  child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextField(
                        helperText: "Product Name",
                        focusNode: _nameFocusNode,
                        errorText: state.productName.validation(),
                        onChanged: (name) => context
                            .read<AddProductFormBloc>()
                            .add(ProductNameChanged(name)),
                      ),
                      CustomTextField(
                        helperText: "Product Code",
                        focusNode: _idFocusNode,
                        keyboardType: TextInputType.numberWithOptions(),
                        errorText: state.id.validation(),
                        onChanged: (code) => context
                            .read<AddProductFormBloc>()
                            .add(ProductCodeChanged(code)),
                      ),
                      CustomTextField(
                          focusNode: _priceFocusNode,
                          errorText: state.price.validation(),
                          keyboardType: TextInputType.numberWithOptions(),
                          helperText: "Default Price",
                          onChanged: (price) => context
                              .read<AddProductFormBloc>()
                              .add(PriceChanged(price))),
                      CustomTextField(
                          helperText: "HSN Code",
                          focusNode: _hsnFocusNode,
                          errorText: state.hsnCode.validation(),
                          keyboardType: TextInputType.numberWithOptions(),
                          onChanged: (hsnCode) => context
                              .read<AddProductFormBloc>()
                              .add(HsnCodeChanged(hsnCode))),
                      CustomTextField(
                          helperText: "Current Stock",
                          focusNode: _stockFocusNode,
                          errorText: state.stock.validation(),
                          keyboardType: TextInputType.numberWithOptions(),
                          onChanged: (stock) => context
                              .read<AddProductFormBloc>()
                              .add(StockChanged(stock))),
                    ],
                  ),
                )),
        );
      },
    );
  }
}

extension on FocusNode {
  void onUnFocused<T extends Bloc>(
      BuildContext context, AddProductFormEvent event) {
    addListener(() {
      if (!hasFocus) {
        context.read<T>().add(event);
      }
    });
  }
}
