import 'package:dio/dio.dart';
import 'package:kma_app/BusinessLayer/DataAccess/Http/api_client.dart';
import 'package:kma_app/Helper/extention/map_parse.dart';

class LoginService {
  ApiClient _apiClient;

  LoginService(this._apiClient);

  Future<String> login(Map<String, dynamic> parameter) async {
    try {
      final response =
      await _apiClient.post('http://171.244.141.137/auth/login', data: parameter);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = response.data as Map<String, dynamic>;
        String accessToken;
        Map<String, dynamic> data = jsonData['data'] as Map<String, dynamic>;
        accessToken = data['accessToken'];
        return accessToken;
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }
}
