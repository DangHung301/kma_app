import 'package:flutter/material.dart';
import 'package:kma_app/Helper/const/color.dart';
import 'package:kma_app/View/Screen/LoginScreen/login_screen.dart';
import 'package:kma_app/View/Screen/LoginScreen/login_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckinScreen extends StatelessWidget {
  const CheckinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: GestureDetector(
            onTap: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              preferences.remove('token');

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginScreen(LoginViewModel())),
                  (route) => false);
            },
            child: Text('asccsa'),
          ),
        ));
  }
}
