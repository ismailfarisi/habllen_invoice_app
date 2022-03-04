import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habllen/model/firestore_failure.dart';
import 'package:habllen/model/payment.dart';
import 'package:habllen/model/result.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/model/product.dart';
import 'package:habllen/repository/remote/firestore.dart';

abstract class Repository {
  Future<Result<FireStoreGetResult<Invoice>, FirestoreFailure>> getInvoices(
      QueryDocumentSnapshot? document);
  Future<Result<List<Invoice>, FirestoreFailure>> getSearchInvoice(
      String keyword);
  Future<Result<void, FirestoreFailure>> createInvoice(Invoice invoice);
  Future<Result<void, FirestoreFailure>> updateInvoice(Invoice invoice);

  Future<Result<List<Customer>, FirestoreFailure>> getCustomers();
  Future<Result<List<Invoice>, FirestoreFailure>> getCompanyInvoice(
      String companyId, DateTimeRange dateTimeRange);
  Future<Result<void, FirestoreFailure>> addCustomer(Customer customer);
  Future<Result<void, FirestoreFailure>> deleteCustomer(Customer customer);

  Future<Result<List<Product>, FirestoreFailure>> getProducts();
  Future<Result<void, FirestoreFailure>> addProduct(Product product);
  Future<Result<void, FirestoreFailure>> updateProduct(Product product);
  Future<Result<void, FirestoreFailure>> deleteProduct(Product product);

  Future<Result<void, FirestoreFailure>> recordPayment(Payment payment);
  Future<Result<List<Payment>, FirestoreFailure>> getCompanyPayments(
      String companyId);
}
