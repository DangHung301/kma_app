import 'package:kma_app/Helper/extention/map_parse.dart';

class Login {
  String username = '';
  String password = '';

  Login({required this.username, required this.password});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(username: json.stringValueOrEmpty('username'), password: json.stringValueOrEmpty('password'));
  }
}
