import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/model/firestore_failure.dart';
import 'package:habllen/model/invoice.dart';
import 'package:habllen/model/payment.dart';
import 'package:habllen/model/product.dart';
import 'package:habllen/model/result.dart';
import 'package:habllen/repository/remote/firestore.dart';
import 'package:habllen/repository/repository.dart';

class RepositoryImpl extends Repository {
  final FirebaseRepository _firebaseRepository;

  RepositoryImpl({required FirebaseRepository firebaseRepository})
      : _firebaseRepository = firebaseRepository;
  @override
  Future<Result<List<Customer>, FirestoreFailure>> getCustomers() =>
      _firebaseRepository.getCustomers();

  @override
  Future<Result<List<Product>, FirestoreFailure>> getProducts() =>
      _firebaseRepository.getProducts();

  @override
  Future<Result<void, FirestoreFailure>> addCustomer(Customer customer) =>
      _firebaseRepository.addCustomer(customer);

  @override
  Future<Result<void, FirestoreFailure>> addProduct(Product product) =>
      _firebaseRepository.addProduct(product);

  @override
  Future<Result<void, FirestoreFailure>> createInvoice(Invoice invoice) =>
      _firebaseRepository.createInvoice(invoice);

  @override
  Future<Result<FireStoreGetResult<Invoice>, FirestoreFailure>> getInvoices(
          QueryDocumentSnapshot? lastDocument) =>
      _firebaseRepository.getInvoices(lastDocument);

  @override
  Future<Result<List<Invoice>, FirestoreFailure>> getSearchInvoice(
          String keyword) =>
      _firebaseRepository.getSearchInvoices(keyword);

  @override
  Future<Result<void, FirestoreFailure>> deleteCustomer(Customer customer) =>
      _firebaseRepository.deleteCustomer(customer);

  @override
  Future<Result<void, FirestoreFailure>> deleteProduct(Product product) =>
      _firebaseRepository.deleteProduct(product);

  @override
  Future<Result<List<Invoice>, FirestoreFailure>> getCompanyInvoice(
          String companyId, DateTimeRange dateTimeRange) =>
      _firebaseRepository.getCompanyInvoices(companyId, dateTimeRange);

  @override
  Future<Result<void, FirestoreFailure>> updateInvoice(Invoice invoice) {
    return _firebaseRepository.updateInvoice(invoice);
  }

  @override
  Future<Result<void, FirestoreFailure>> recordPayment(Payment payment) {
    return _firebaseRepository.recordPayment(payment);
  }

  @override
  Future<Result<List<Payment>, FirestoreFailure>> getCompanyPayments(
      String companyId) {
    return _firebaseRepository.getCompanyPayments(companyId);
  }

  @override
  Future<Result<void, FirestoreFailure>> updateProduct(Product product) {
    return _firebaseRepository.updateProduct(product);
  }
}
