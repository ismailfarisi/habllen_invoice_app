import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habllen/model/auth_model/user.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/model/firestore_failure.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/model/payment.dart';
import 'package:habllen/model/product.dart';
import 'package:habllen/model/result.dart';
import 'package:habllen/repository/auth_repositoryimpl.dart';
import 'package:habllen/shared/constants/constants.dart';

class FirebaseRepository {
  final Stream<User> userStream;
  late final fireStore = FirebaseFirestore.instance;
  late DocumentReference _userCollection;

  FirebaseRepository(this.userStream) {
    userStream.listen((user) {
      _userCollection = fireStore.collection("Users").doc(user.id);
    });
  }

  Future<Result<List<Customer>, FirestoreFailure>> getCustomers() async {
    final List<Customer> list = [];
    try {
      final clients = await _userCollection.collection("customers").get();
      clients.docs.forEach((element) {
        list.add(Customer.fromjson(element.data()));
      });
      print(list);
      return Result.success(list);
    } on PlatformException catch (e) {
      return Result.error(FirestoreFailure.unexpected());
    }
  }

  Future<Result<void, FirestoreFailure>> addCustomer(Customer customer) async {
    try {
      final ref = _userCollection.collection("customers").doc();
      final result = await fireStore.runTransaction((transaction) async {
        final id = ref.id;
        final data = customer.copyWith(id: id).toJson();
        transaction.set(ref, data);
        transaction.set(_userCollection,
            {LAST_CUSTOMER_UPDATE: Timestamp.now()}, SetOptions(merge: true));
        return null;
      });
      return Result.success(result);
    } on PlatformException catch (e) {
      return Result.error(FirestoreFailure.unexpected());
    }
  }

  Future<Result<void, FirestoreFailure>> updateCustomer(
      Customer customer) async {
    try {
      final result = await _userCollection
          .collection("customers")
          .doc(customer.id)
          .update(customer.toJson());
      return Result.success(result);
    } on PlatformException catch (e) {
      return Result.error(FirestoreFailure.unexpected());
    }
  }

  Future<Result<void, FirestoreFailure>> deleteCustomer(
      Customer customer) async {
    try {
      final result = await _userCollection
          .collection("customers")
          .doc(customer.id)
          .delete();
      return Result.success(result);
    } on PlatformException catch (e) {
      return Result.error(FirestoreFailure.unexpected());
    }
  }

  Future<Result<void, FirestoreFailure>> addProduct(Product product) async {
    try {
      final ref = _userCollection.collection("products").doc();
      final id = ref.id;
      final result = await ref.set(product.copyWith(id: id).toJson());
      return Result.success(result);
    } on PlatformException catch (e) {
      return Result.error(FirestoreFailure.unexpected());
    }
  }

  Future<Result<void, FirestoreFailure>> updateProduct(Product product) async {
    try {
      final result = await _userCollection
          .collection("products")
          .doc(product.id)
          .set(product.toJson());
      return Result.success(result);
    } on PlatformException catch (e) {
      return Result.error(FirestoreFailure.unexpected());
    }
  }

  Future<Result<void, FirestoreFailure>> deleteProduct(Product product) async {
    try {
      final result =
          await _userCollection.collection("product").doc(product.id).delete();
      return Result.success(result);
    } on PlatformException catch (e) {
      return Result.error(FirestoreFailure.unexpected());
    }
  }

  Future<Result<FireStoreGetResult<Invoice>, FirestoreFailure>> getInvoices(
      [QueryDocumentSnapshot? lastDocument]) async {
    final List<Invoice> data = [];
    bool hasReachedMax = false;
    late final invoices;
    late final QueryDocumentSnapshot? lastDoc;

    try {
      if (lastDocument == null) {
        invoices = await _userCollection
            .collection(INVOICES_COLLECTION)
            .orderBy("invoiceNo")
            .limit(15)
            .get();
      } else {
        invoices = await _userCollection
            .collection(INVOICES_COLLECTION)
            .orderBy("invoiceNo")
            .startAfterDocument(lastDocument)
            .limit(15)
            .get();
      }
      if (invoices.docs.length < 15) {
        hasReachedMax = true;
        lastDoc = null;
      } else {
        lastDoc = invoices.docs.last;
      }
      invoices.docs.forEach((element) {
        final Invoice invoice = Invoice.fromjson(element.data());
        data.add(invoice);
      });
      return Result.success(FireStoreGetResult(
          data: data,
          hasReachedMax: hasReachedMax,
          lastDocument: invoices.docs.last));
    } on PlatformException catch (e) {
      return Result.error(FirestoreFailure.unexpected());
    }
  }

  Future<Result<List<Invoice>, FirestoreFailure>> getSearchInvoices(
      String keyword) async {
    final List<Invoice> data = [];
    try {
      final invoices = await _userCollection
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
      return Result.error(FirestoreFailure.unexpected());
    }
  }

  Future<Result<List<Invoice>, FirestoreFailure>> getCompanyInvoices(
      String companyId, DateTimeRange dateTimeRange) async {
    print("companyId: $companyId , dateTimeRange: $dateTimeRange");
    final List<Invoice> data = [];
    try {
      final companyQuery = await _userCollection
          .collection("invoices")
          .where("company.id", isEqualTo: companyId)
          .where("date",
              isGreaterThanOrEqualTo: Timestamp.fromDate(dateTimeRange.start),
              isLessThanOrEqualTo: Timestamp.fromDate(dateTimeRange.end))
          .get();

      // final invoices = await companyQuery.get();
      companyQuery.docs.forEach((element) {
        final Invoice invoice = Invoice.fromjson(element.data());
        data.add(invoice);
      });

      return Result.success(data);
    } catch (e) {
      print(e.runtimeType);
      return Result.error(FirestoreFailure.unexpected());
    }
  }

  Future<Result<List<Product>, FirestoreFailure>> getProducts() async {
    final List<Product> data = [];
    try {
      final instance = await _userCollection.collection("products").get();
      instance.docs.forEach((element) {
        print(element.data());
        data.add(Product.fromJson(element.data()));
      });
      return Result.success(data);
    } on Exception catch (e) {
      return Result.error(FirestoreFailure.unexpected());
    }
  }

  Future<Result<void, FirestoreFailure>> createInvoice(Invoice invoice) async {
    try {
      int? invNo;
      final _invoiceCollectionRef =
          _userCollection.collection(INVOICES_COLLECTION);
      final _customerCollectionRef =
          _userCollection.collection(CUSTOMERS_COLLECTION);
      final _productCollectionRef =
          _userCollection.collection(PRODUCTS_COLLECTION);
      final result = await fireStore.runTransaction((transaction) async {
        final id = _invoiceCollectionRef.doc().id;

        await transaction.get(_userCollection).then((value) {
          invNo = value.get(LAST_INVOICE_NO) ?? null;
        });
        (invNo == null) ? invNo = 100001 : invNo = invNo! + 1;
        final invoiceL = invoice.copyWith(invoiceNo: invNo!, id: id);
        print(invNo);
        transaction.set(_invoiceCollectionRef.doc(id), invoiceL.toJson());
        transaction.set(
            _userCollection,
            {
              LAST_INVOICE_NO: invNo!,
              LAST_INVOICE_UPDATE: Timestamp.now(),
              LAST_CUSTOMER_UPDATE: Timestamp.now()
            },
            SetOptions(merge: true));
        transaction.set(
            _customerCollectionRef.doc(invoice.company!.id!),
            {
              LAST_INVOICE_UPDATE: Timestamp.now(),
              TOTAL_INVOICES_AMOUNT: FieldValue.increment(invoice.totalPrice!)
            },
            SetOptions(merge: true));
        invoice.products.forEach((element) {
          transaction.set(
              _productCollectionRef.doc(element.product.id),
              {"currentStock": FieldValue.increment(-element.quantity)},
              SetOptions(merge: true));
        });

        return null;
      });
      return Result.success(result);
    } on PlatformException catch (e) {
      return Result.error(FirestoreFailure.unexpected());
    }
  }

  Future<Result<void, FirestoreFailure>> updateInvoice(Invoice invoice) async {
    try {
      final result = await _userCollection
          .collection("invoices")
          .doc(invoice.id)
          .set(invoice.toJson(), SetOptions(merge: true));
      return Result.success(result);
    } catch (e) {
      throw e;
    }
  }

  Future<Result<void, FirestoreFailure>> recordPayment(Payment payment) async {
    final paymentCollectionRef =
        _userCollection.collection(PAYMENTS_COLLECTION);
    final customeryCollectionRef =
        _userCollection.collection(CUSTOMERS_COLLECTION);
    try {
      final result = await fireStore.runTransaction((transaction) async {
        final id = paymentCollectionRef.doc().id;
        final paymentL = payment.copyWith(id: id);
        transaction.set(paymentCollectionRef.doc(id), paymentL.toJson());
        transaction.set(_userCollection, {LAST_PAYMENT_UPDATE: Timestamp.now()},
            SetOptions(merge: true));
        transaction.set(
            customeryCollectionRef.doc(payment.companyId),
            {
              LAST_PAYMENT_UPDATE: Timestamp.now(),
              TOTAL_PAYMENTS_RECEIVED: FieldValue.increment(payment.amount)
            },
            SetOptions(merge: true));
        return null;
      });
      return Result.success(result);
    } catch (e) {
      return Result.error(FirestoreFailure.unexpected());
    }
  }

  Future<Result<List<Payment>, FirestoreFailure>> getCompanyPayments(
      String companyId) async {
    final List<Payment> data = [];
    try {
      final instance = await _userCollection
          .collection(PAYMENTS_COLLECTION)
          .where(COMPANY_ID, isEqualTo: companyId)
          .get();
      instance.docs.forEach((element) {
        data.add(Payment.fromJson(element.data()));
      });
      return Result.success(data);
    } on PlatformException catch (e) {
      return Result.error(FirestoreFailure.unexpected());
    }
  }
}

class FireStoreGetResult<T> {
  final List<T> data;
  final bool hasReachedMax;
  final QueryDocumentSnapshot? lastDocument;

  FireStoreGetResult(
      {required this.data, required this.hasReachedMax, this.lastDocument});
}
