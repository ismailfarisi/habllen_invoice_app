import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:habllen/model/company.dart';
import 'package:habllen/repository/remote/url.dart';
import 'package:http/http.dart' as http;

class RemoteRepository {
  Future<List<Company>> getCustomers() async {
    final httpClient = http.Client();
    try {
      final response = await httpClient.get(Url().getCustomers());
      print(response.statusCode);
      print(response.body);
      return compute(parsePhotos, response.body);
    } catch (e) {
      throw e;
    }
  }
}

List<Company> parsePhotos(String responseBody) {
  final parser = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  final list = parser.map<Company>((json) => Company.fromjson(json)).toList();
  print(list);
  return list;
}
