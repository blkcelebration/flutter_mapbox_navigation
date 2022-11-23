// ignore_for_file: constant_identifier_names

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static const _storage = FlutterSecureStorage();
  static const USER_TOKEN_KEY = 'token';

  // GET
  static Future<String?> getData({required String key}) async {
    return await _storage.read(key: key);
  }

  // WRITE
  static Future setData({required String key, required String data}) async {
    return await _storage.write(key: key, value: data);
  }
}
