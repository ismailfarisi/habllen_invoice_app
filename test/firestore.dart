import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habllen/model/auth_model/user.dart';
import 'package:habllen/model/customer.dart';
import 'package:habllen/repository/remote/firestore.dart';

import "dart:io" as io;
import "dart:convert" as convert;

import 'package:mockito/mockito.dart';

class MockUser extends Mock implements User {}

class MockCustomer extends Mock implements Customer {}

void main() {
  // test("streing", () async {
  //   final inputfile = io.File("C:\\Users\\AJMAL\\Downloads\\invoice.json");
  //   final outputfile = io.File("C:\\Users\\AJMAL\\Downloads\\invoice_out.json");
  //   final data = await inputfile.readAsString();
  //   final List<dynamic> json = convert.jsonDecode(data);
  //   for (final doc in json) {
  //     doc["date"] = "Timestamp.fromMicrosecondsSinceEpoch(${doc["date"]})";
  //   }
  //   outputfile.writeAsString(convert.jsonEncode(json));
  // });

  test("update_data", () async {
    await Firebase.initializeApp();
    final firestoreInstance = FirebaseFirestore.instance
      ..useFirestoreEmulator("localhost", 8081);
    final user1 = MockUser();
    when(user1.id).thenReturn("1");
    final userStream = Stream.fromIterable([user1]);

    final repo = FirebaseRepository(userStream, firestoreInstance);
    final customer = MockCustomer();

    repo.addCustomer(customer);
  });
}
