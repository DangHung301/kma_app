import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  Dio dio;

  ApiClient(this.dio);

  Future<void> userAuthenTokenIfNeed() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString('token') ?? '';

    if(dio.options.headers.isEmpty) {
      dio.options.headers = {};
    }

    if(token.isNotEmpty) {
      dio.options.headers['Authorization'] = token;
    }
  }

  Future<Response> post(String url, {required Map<String, dynamic> data}) {
    try {
      return dio.post(url, data: data);
    } catch (e) {
      throw Exception();
    }
  }

  Future<Response> get(String url) async{
    await userAuthenTokenIfNeed();

    try {
      return dio.get(url);
    } catch (e) {
      throw Exception();
    }
  }
}
