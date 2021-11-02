import 'package:habllen/model/company.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/model/product.dart';

abstract class Repository {
  Future<List<Product>> getProducts();
  Future<List<Company>> getCustomers();
  Future<void> addProduct(Product product);
  Future<void> addCustomer(Company customer);

  Future<int> getLastInvoiceNo();
  Future<String> createInvoice(Invoice invoice);
}
