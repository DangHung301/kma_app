import 'package:kma_app/BusinessLayer/DataAccess/Http/DI/di.dart';
import 'package:kma_app/BusinessLayer/DataAccess/Http/Service/login_service.dart';

class LoginViewModel {
  bool isCheckLogin = false;
  LoginService service = getIt<LoginService>();

  Future<String> login(String username, String password) async{
    Map<String, String> parameter = {
      'username': username,
      'password': password
    };

    final data = service.login(parameter);

    return data;
  }
}

