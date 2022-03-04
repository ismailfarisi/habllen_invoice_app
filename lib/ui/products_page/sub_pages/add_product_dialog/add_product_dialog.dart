import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:habllen/model/product.dart';
import 'package:habllen/shared/widgets/custom_add_field.dart';
import 'package:habllen/ui/products_page/bloc/productspage_bloc.dart';
import 'package:habllen/ui/products_page/sub_pages/add_product_dialog/bloc/addproductform_bloc.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({
    Key? key,
  }) : super(key: key);
  static const String routeName = 'add_product_full_dialog';

  @override
  Widget build(BuildContext context) {
    return AddProductForm();
  }
}

class AddProductForm extends StatelessWidget {
  const AddProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductFormBloc, AddProductFormState>(
      listener: (context, state) {
        Navigator.pop(context);
      },
      listenWhen: (previous, current) =>
          current.status == FormzStatus.submissionSuccess,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text("Add New Product"), actions: [
            IconButton(
                onPressed: () {
                  if (state.status.isValid) {
                    context.read<AddProductFormBloc>().add(Submitted());
                  } else {
                    _showSnackBar(
                        context, "Please fill all the require fields");
                  }
                },
                icon: Icon(Icons.check))
          ]),
          body: (state.status == FormzStatus.submissionInProgress)
              ? Center(child: CircularProgressIndicator())
              : Form(
                  child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomAddField(
                        value: state.productName.value?.isEmpty ?? true
                            ? null
                            : state.productName.value,
                        fieldName: "Product Name",
                        onChanged: (name) => context
                            .read<AddProductFormBloc>()
                            .add(ProductNameChanged(name)),
                        validator: state.productName.error,
                      ),
                      CustomAddField(
                        value: (state.id.value == null)
                            ? null
                            : state.id.value.toString(),
                        fieldName: "Product Code",
                        onChanged: (code) => context
                            .read<AddProductFormBloc>()
                            .add(ProductCodeChanged(code)),
                        validator: state.id.error,
                      ),
                      CustomAddField(
                        value: (state.price.value == null)
                            ? null
                            : state.price.value.toString(),
                        fieldName: "Default Price",
                        onChanged: (price) => context
                            .read<AddProductFormBloc>()
                            .add(PriceChanged(price)),
                        validator: state.price.error,
                      ),
                      CustomAddField(
                        value: (state.stock.value == null)
                            ? null
                            : state.stock.value.toString(),
                        fieldName: "GST Percentage",
                        onChanged: (gstPercentage) => context
                            .read<AddProductFormBloc>()
                            .add(GstPercentageChanged(gstPercentage)),
                        validator: state.gstPercentage.error,
                      ),
                      CustomAddField(
                        value: state.hsnCode.value?.isEmpty ?? true
                            ? null
                            : state.hsnCode.value,
                        fieldName: "HSN Code",
                        onChanged: (hsnCode) => context
                            .read<AddProductFormBloc>()
                            .add(HsnCodeChanged(hsnCode)),
                        validator: state.hsnCode.error,
                      ),
                      CustomAddField(
                        value: (state.gstPercentage.value == null)
                            ? null
                            : state.gstPercentage.value.toString(),
                        fieldName: "Current Stock",
                        onChanged: (stock) => context
                            .read<AddProductFormBloc>()
                            .add(StockChanged(stock)),
                        validator: state.stock.error,
                      ),
                    ],
                  ),
                )),
        );
      },
    );
  }

  void _showSnackBar(BuildContext context, String s) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(s),
      ));
  }
}

class AddProductPageArguments {
  final ProductspageBloc productspageBloc;
  final Product? product;

  AddProductPageArguments({required this.productspageBloc, this.product});
}
