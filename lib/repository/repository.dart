import 'package:habllen/model/result.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/model/product.dart';

abstract class Repository {
  Future<Result<List<Invoice>>> getInvoices();
  Future<Result<List<Invoice>>> getSearchInvoice(String keyword);
  Future<Result<List<Product>>> getProducts();
  Future<Result<List<Company>>> getCustomers();

  Future<Result<void>> addProduct(Product product);
  Future<Result<void>> addCustomer(Company customer);

  Future<Result<int>> getLastInvoiceNo();
  Future<Result<void>> createInvoice(Invoice invoice);
  Future<Result<void>> deleteCustomer(Company customer);
  Future<Result<void>> deleteProduct(Product product);
}
