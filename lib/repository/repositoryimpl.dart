import 'package:habllen/model/company.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/model/product.dart';
import 'package:habllen/model/result.dart';
import 'package:habllen/repository/remote/firestore.dart';
import 'package:habllen/repository/repository.dart';

class RepositoryImpl extends Repository {
  final FirebaseRepository _firebaseRepository;

  RepositoryImpl({FirebaseRepository? firebaseRepository})
      : _firebaseRepository = firebaseRepository ?? FirebaseRepository();
  @override
  Future<Result<List<Company>>> getCustomers() =>
      _firebaseRepository.getCustomers();

  @override
  Future<Result<List<Product>>> getProducts() =>
      _firebaseRepository.getProducts();

  @override
  Future<Result<void>> addCustomer(Company customer) =>
      _firebaseRepository.addCustomer(customer);

  @override
  Future<Result<void>> addProduct(Product product) =>
      _firebaseRepository.addProduct(product);

  @override
  Future<Result<void>> createInvoice(Invoice invoice) =>
      _firebaseRepository.createInvoice(invoice);

  @override
  Future<Result<int>> getLastInvoiceNo() =>
      _firebaseRepository.getLastInvoiceNo();

  @override
  Future<Result<List<Invoice>>> getInvoices() =>
      _firebaseRepository.getInvoices();

  @override
  Future<Result<List<Invoice>>> getSearchInvoice(String keyword) =>
      _firebaseRepository.getSearchInvoices(keyword);

  @override
  Future<Result<void>> deleteCustomer(Company customer) =>
      _firebaseRepository.deleteCustomer(customer);
}
