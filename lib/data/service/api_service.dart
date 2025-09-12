
import 'dart:convert';
import 'dart:io';

import 'package:flutter_tech_task/utils/app_exceptions.dart';
import 'package:flutter_tech_task/utils/result.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../generated/data/service/api_service.g.dart';            


@riverpod
ApiService apiService(Ref ref)=> ApiService();

class ApiService {

  final http.Client _client;
  final String _baseUrl = "https://jsonplaceholder.typicode.com";

    Map<String, String> get _headers => {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
    'User-Agent': 'Flutter-App/1.0.0', // Important: Some APIs block requests without User-Agent
    'Cache-Control': 'no-cache',
  };

  ApiService({http.Client? client}) : _client = client ?? http.Client();

  Future<Result<dynamic>> get({required String endpoint}) async {
    try {
      var url = Uri.parse(_baseUrl + endpoint);
      var response = await _client.get(url, headers: _headers);
      if (response.statusCode != 200) {

        return Result.error(BadRequestException());
      }
      final json = jsonDecode(response.body);
      return Result.ok(json);
      
    }on SocketException{
      return Result.error(NetworkError());
      }
     catch (e) {
      return Result.error(UnKnownError());
    }
  }

}