import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habllen/model/Result.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/model/product.dart';

class FirebaseRepository {
  final firestore = FirebaseFirestore.instance;

  Future<List<Company>> getCustomers() async {
    final List<Company> list = [];
    try {
      final clients = await firestore.collection("customers").get();
      clients.docs.forEach((element) {
        list.add(Company.fromjson(element.data()));
      });
      return list;
    } catch (e) {
      throw e;
    }
  }

  Future<String> addCustomer(Company customer) async {
    print("started");
    try {
      final instance =
          await firestore.collection("customers").add(customer.toJson());
      print("${instance.id}");
      return instance.id;
    } catch (e) {
      throw e;
    }
  }

  Future<String> addProduct(Product product) async {
    print("started");
    try {
      final clients =
          await firestore.collection("products").add(product.toJson());
      return clients.id;
    } catch (e) {
      throw e;
    }
  }

  Future<List<Invoice>> getInvoices() async {
    final List<Invoice> list = [];
    try {
      final invoices = await firestore.collection("invoices").get();
      invoices.docs.forEach((element) {
        final Invoice invoice = Invoice.fromjson(element.data());
        list.add(invoice);
      });
      print(list);
      return list;
    } on Exception {
      return list;
    } catch (e) {
      throw e;
    }
  }

  Future<List<Product>> getProducts() async {
    final List<Product> list = [];
    try {
      final instance = await firestore.collection("products").get();
      instance.docs.forEach((element) {
        list.add(Product.fromJson(element.data()));
      });
      print(list);
      return list;
    } catch (e) {
      throw e;
    }
  }

  Future<String> createInvoice(Invoice invoice) async {
    print(invoice.toJson());
    try {
      final instance =
          await firestore.collection("invoices").add(invoice.toJson());
      return instance.id;
    } catch (e) {
      throw e;
    }
  }

  Future<int> getLastInvoiceNo() async {
    try {
      final instance = await firestore
          .collection("invoices")
          .orderBy("invoiceNo", descending: true)
          .limit(1)
          .get();
      final lastinvoiceNo = instance.docs.first.get("invoiceNo") as int;
      return lastinvoiceNo;
    } catch (e) {
      throw e;
    }
  }
}
