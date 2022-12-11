import 'dart:convert';
import 'dart:developer';

import 'package:thinkz/shared/consts/paths.dart';
import 'package:thinkz/shared/models/test/test_model.dart';
import 'package:http/http.dart' as http;
import '../secure_storage/user_secure_storage.dart';

class HttpService {
  static createRequestHeaders() async {
    String key = UserSecureStorage.USER_TOKEN_KEY;
    String token = await UserSecureStorage.getData(key: key) ?? '';
    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer ' + token,
      "content-type": "application/json",
    };
    return requestHeaders;
  }

  static Future<dynamic> getRequest(String path) async {
    dynamic item;
    try {
      final response = await http.get(
        Uri.parse(path),
        headers: await createRequestHeaders(),
      );
      if (response.statusCode == 200) {
        item = json.decode(response.body);
      } else {
        print("error ${response.body}");
      }
    } catch (e) {
      log(e.toString());
    }
    return item;
  }

  static Future<TestModel?> getSinglePostData() async {
    final item = await getRequest(ServerPaths.TEST);
    final result = TestModel.fromJson(item);
    return result;
  }
}
