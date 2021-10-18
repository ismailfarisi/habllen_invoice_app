import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
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
      final clients =
          await firestore.collection("customers").add(customer.toJson());
      print("client.id");
      return clients.id;
    } catch (e) {
      throw e;
    }
  }

  Future<Result<List<Invoice>>> getInvoices() async {
    final List<Invoice> list = [];
    try {
      final invoices = await firestore.collection("invoices").get();
      invoices.docs.forEach((element) {
        list.add(Invoice.fromjson(element.data()));
      });
      return Result.success(list);
    } catch (exception) {
      Exception e = exception as Exception;

      return Result.error(e);
    }
  }

  Future<List<Product>> getProducts() async {
    final List<Product> list = [];
    try {
      final invoices = await firestore.collection("products").get();
      invoices.docs.forEach((element) {
        list.add(Product.fromJson(element.data()));
      });
      return list;
    } catch (e) {
      throw e;
    }
  }
}
