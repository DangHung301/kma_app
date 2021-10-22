import 'package:dio/dio.dart';

class ApiClient {
  Dio dio;

  ApiClient(this.dio);

  Future<Response> post(String url, {required Map<String, dynamic> data}) {
    try {
      return dio.post(url, data: data);
    } catch (e) {
      throw Exception();
    }
  }
}