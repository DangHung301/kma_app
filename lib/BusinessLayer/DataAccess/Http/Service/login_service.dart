import 'package:dio/dio.dart';
import 'package:kma_app/Helper/extention/map_parse.dart';

class LoginService {
  Dio dio = Dio();

  Future<String> login(Map<String, dynamic> parameter) async{
    final response = await dio.post('171.244.141.137/auth/login', data: parameter);
    Map<String, dynamic> jsonData = response.data as Map<String, dynamic>;
    String message = jsonData.stringValueOrEmpty('message');
    String accessToken;
    if(message == 'Login successfully') {
      final data = jsonData['data'];
      accessToken = data['accessToken'];
      return accessToken;
    }
    return '';
  }
}