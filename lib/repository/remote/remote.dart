import 'dart:convert';

import 'package:habllen/model/company.dart';
import 'package:habllen/repository/remote/url.dart';
import 'package:http/http.dart' as http;

class RemoteRepository {
  Future<List<Company>> getCustomers() async {
    final httpClient = http.Client();
    try {
      final response = await httpClient.get(Url().getCustomers());
      print(response.statusCode);
      final parser = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parser.map<Company>((json) => Company.fromjson(json)).toList();
    } catch (e) {
      throw e;
    }
  }
}
