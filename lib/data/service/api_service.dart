
import 'dart:convert';

import 'package:flutter_tech_task/utils/app_exceptions.dart';
import 'package:flutter_tech_task/utils/result.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

@riverpod
ApiService apiService(Ref ref)=> ApiService();

class ApiService {

  final String _baseUrl = "https://jsonplaceholder.typicode.com";

  Future<Result<dynamic>> get(String endpoint) async {
    try {
      var url = Uri.https(_baseUrl,endpoint);
      var response = await http.get(url);
      if (response.statusCode != 200) {
        return Result.error(UnKnownError());
      }
      final json = jsonDecode(response.body);
      return Result.ok(json);
      
    } catch (e) {
      return Result.error(UnKnownError());
    }
  }

}