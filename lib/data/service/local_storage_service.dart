import 'dart:convert';

import 'package:flutter_tech_task/utils/app_exceptions.dart';
import 'package:flutter_tech_task/utils/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

      part '../../generated/data/service/local_storage_service.g.dart';                                                          

@riverpod
LocalStorageService localStorageService(Ref ref) => LocalStorageService();

class LocalStorageService {
  late SharedPreferences _sharedPreferences;

  Future<Result<bool>> delete(String key, String id) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return await _sharedPreferences.remove(key)
        ? Result.ok(true)
        : Result.error(Exception("Error clearing data"));
  }

  Future<Result<List<dynamic>>> getList(String key) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    List<String>? data = _sharedPreferences.getStringList(key);
    if (data != null) {
      return Result.ok(data.map((e) => jsonDecode(e)).toList());
    } else {
      return Result.error(NotFoundError());
    }
  }

  Future<Result<bool>> createList(String key,List<dynamic> data) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    List<String> encodedData =
        List<String>.from(data.map((e) => jsonEncode(e)).toList());
    return await _sharedPreferences.setStringList(key, encodedData)
        ? Result.ok(true)
        : Result.error(Exception("Error Saving data"));
  }

  Future<Result<bool>> clear() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return await _sharedPreferences.clear()
        ? Result.ok(true)
        : Result.error(Exception("Error clearing data"));
  }
}