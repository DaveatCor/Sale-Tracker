import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  
  static String? _decode;
  static SharedPreferences? _preferences;

  static Future<void> clearStorage() async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences!.clear();
  }

  static Future<SharedPreferences> storeData(dynamic data, String path) async {
    try {

      _preferences = await SharedPreferences.getInstance();
      _decode = jsonEncode(data);
      
      await _preferences!.setString(path, _decode!);

    } catch (e){
      
      if (kDebugMode) {
        print("Error storeData $e");
      }
    }
    return _preferences!;
  }

  static Future<dynamic> fetchData(String path) async {
    _preferences = await SharedPreferences.getInstance();

    final data = _preferences!.getString(path);

    if (data == null) {
      return null;
    } else {
      return json.decode(data);
    }
  }
  
}