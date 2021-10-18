import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/repository/remote/firestore.dart';

void main() async {
  await Firebase.initializeApp();

  final firebase = FirebaseRepository();

  final customer = Company(
      name: "name", addressOne: "addressOne", gst: 'gst', addressTwo: "aaaaa");

  group('customer_remote', () {
    test('add_customer to firestore', () async {
      await firebase.addCustomer(customer);
    });
  });
}
