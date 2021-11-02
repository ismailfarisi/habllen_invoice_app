import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/model/product.dart';
import 'package:habllen/repository/remote/firestore.dart';
import 'package:habllen/repository/repositoryimpl.dart';
import 'package:habllen/ui/settings_page/sub_pages/add_product_dialog/cubit/addproducct_cubit.dart';
import 'package:habllen/widgets/text_field_widget.dart';

class AddProductDialog extends StatelessWidget {
  const AddProductDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddproducctCubit(
            repository:
                RepositoryImpl(firebaseRepository: FirebaseRepository())),
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
  late final TextEditingController _namecontroller;
  late final TextEditingController _priceController;
  late final TextEditingController _hsnCodeController;
  late final TextEditingController _currentStockController;

  @override
  void initState() {
    _namecontroller = TextEditingController();
    _priceController = TextEditingController();
    _hsnCodeController = TextEditingController();
    _currentStockController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AddproducctCubit>();
    final status = cubit.state.status;
    if (status == Status.success) Navigator.pop(context);
    return AlertDialog(
      title: Text("Add New Product"),
      actions: (status == Status.loading)
          ? []
          : [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    final product = Product(
                        name: _namecontroller.text,
                        price: double.parse(_priceController.text),
                        hsnCode: _hsnCodeController.text,
                        currentStock:
                            double.parse(_currentStockController.text));
                    cubit.addProduct(product);
                  },
                  child: Text("Add"))
            ],
      content: (status == Status.loading)
          ? SizedBox(height: 60, width: 60, child: CircularProgressIndicator())
          : Form(
              child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextField(
                    helperText: "Product Name",
                    controller: _namecontroller,
                  ),
                  CustomTextField(
                    helperText: "Default Price",
                    controller: _priceController,
                  ),
                  CustomTextField(
                    helperText: "HSN Code",
                    controller: _hsnCodeController,
                  ),
                  CustomTextField(
                    helperText: "Current Stock",
                    controller: _currentStockController,
                  ),
                ],
              ),
            )),
    );
  }
}
