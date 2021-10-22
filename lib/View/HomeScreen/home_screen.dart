import 'package:flutter/material.dart';
import 'package:kma_app/BusinessLayer/DataAccess/Http/DI/di.dart';
import 'package:kma_app/View/LoginScreen/login_screen.dart';
import 'package:kma_app/View/LoginScreen/login_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(getIt<LoginViewModel>())));
        },
        child: Text('asccsa'),
      ),)
    );
  }

}