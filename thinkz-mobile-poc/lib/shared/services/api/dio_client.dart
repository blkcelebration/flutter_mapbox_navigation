import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  Future<Response<dynamic>> get(String endpoint) async {
    print(endpoint);
    return await _dio.get(endpoint);
  }
}
