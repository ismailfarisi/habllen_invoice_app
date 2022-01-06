import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/model/product.dart';
import 'package:habllen/model/result.dart';

class FirebaseRepository {
  final firestore = FirebaseFirestore.instance;

  Future<Result<List<Company>>> getCustomers() async {
    final List<Company> list = [];
    try {
      final clients = await firestore.collection("customers").get();
      clients.docs.forEach((element) {
        list.add(Company.fromjson(element.data()));
      });
      return Result.success(list);
    } on PlatformException catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> addCustomer(Company customer) async {
    try {
      final ref = firestore.collection("customers").doc();
      final id = ref.id;
      final result = await ref.set(customer.toJson(id: id));
      return Result.success(result);
    } on PlatformException catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> updateCustomer(Company customer) async {
    try {
      final result = await firestore
          .collection("customers")
          .doc(customer.id)
          .update(customer.toJson());
      return Result.success(result);
    } on PlatformException catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> deleteCustomer(Company customer) async {
    try {
      final result =
          await firestore.collection("customers").doc(customer.id).delete();
      return Result.success(result);
    } on PlatformException catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> addProduct(Product product) async {
    try {
      final result =
          await firestore.collection("products").add(product.toJson());
      return Result.success(result);
    } on PlatformException catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> updateProduct(Product product) async {
    try {
      final result =
          await firestore.collection("products").add(product.toJson());
      return Result.success(result);
    } on PlatformException catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<List<Invoice>>> getInvoices() async {
    final List<Invoice> data = [];
    try {
      final invoices = await firestore.collection("invoices").get();
      invoices.docs.forEach((element) {
        final Invoice invoice = Invoice.fromjson(element.data());
        data.add(invoice);
      });
      return Result.success(data);
    } on PlatformException catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<List<Invoice>>> getSearchInvoices(String keyword) async {
    final List<Invoice> data = [];
    try {
      final invoices = await firestore
          .collection("invoices")
          .where("company.name",
              isGreaterThanOrEqualTo: keyword.toLowerCase(),
              isLessThanOrEqualTo: "~")
          .get();
      invoices.docs.forEach((element) {
        final Invoice invoice = Invoice.fromjson(element.data());
        data.add(invoice);
      });

      return Result.success(data);
    } on PlatformException catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<List<Product>>> getProducts() async {
    final List<Product> data = [];
    try {
      final instance = await firestore.collection("products").get();
      instance.docs.forEach((element) {
        data.add(Product.fromJson(element.data()));
      });
      return Result.success(data);
    } on PlatformException catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> createInvoice(Invoice invoice) async {
    try {
      final result =
          await firestore.collection("invoices").add(invoice.toJson());
      return Result.success(result);
    } on PlatformException catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> updateInvoice(Invoice invoice) async {
    try {
      final result =
          await firestore.collection("invoices").add(invoice.toJson());
      return Result.success(result);
    } catch (e) {
      throw e;
    }
  }

  Future<Result<int>> getLastInvoiceNo() async {
    try {
      final result = await firestore
          .collection("invoices")
          .orderBy("invoiceNo", descending: true)
          .limit(1)
          .get();
      final lastinvoiceNo = result.docs.first.get("invoiceNo") as int;
      return Result.success(lastinvoiceNo);
    } on PlatformException catch (e) {
      return Result.error(e);
    }
  }
}
