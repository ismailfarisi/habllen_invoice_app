import 'package:habllen/model/company.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/model/product.dart';
import 'package:habllen/repository/remote/firestore.dart';
import 'package:habllen/repository/repository.dart';

class RepositoryImpl extends Repository {
  final FirebaseRepository _firebaseRepository;

  RepositoryImpl({FirebaseRepository? firebaseRepository})
      : _firebaseRepository = firebaseRepository ?? FirebaseRepository();
  @override
  Future<List<Company>> getCustomers() => _firebaseRepository.getCustomers();

  @override
  Future<List<Product>> getProducts() => _firebaseRepository.getProducts();

  @override
  Future<void> addCustomer(Company customer) =>
      _firebaseRepository.addCustomer(customer);

  @override
  Future<void> addProduct(Product product) =>
      _firebaseRepository.addProduct(product);

  @override
  Future<String> createInvoice(Invoice invoice) =>
      _firebaseRepository.createInvoice(invoice);

  @override
  Future<int> getLastInvoiceNo() => _firebaseRepository.getLastInvoiceNo();
}
