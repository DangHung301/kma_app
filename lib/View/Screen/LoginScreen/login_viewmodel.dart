import 'package:kma_app/BusinessLayer/DataAccess/Http/DI/di.dart';
import 'package:kma_app/BusinessLayer/DataAccess/Http/Service/login_service.dart';

class LoginViewModel {
  LoginService service = getIt<LoginService>();
  String? userNameInvalidate, passwordInvalidate;
  bool isPassword = false;

  Future<String> login(String username, String password) async {
    Map<String, String> parameter = {
      'username': username,
      'password': password
    };

    final data = service.login(parameter);

    return data;
  }

  void checkInvalidate(String userName, String password) {
    if (userName.isEmpty && password.isEmpty) {
      userNameInvalidate = 'Value Can\'t Be Empty';
      passwordInvalidate = 'Value Can\'t Be Empty';
    } else if (userName.isEmpty) {
      userNameInvalidate = 'Value Can\'t Be Empty';
      passwordInvalidate = null;
    } else if (password.isEmpty) {
      passwordInvalidate = 'Value Can\'t Be Empty';
      userNameInvalidate = null;
    } else {
      userNameInvalidate = null;
      passwordInvalidate = null;
    }
  }
}
