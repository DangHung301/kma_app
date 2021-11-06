import 'package:flutter/material.dart';
import 'package:kma_app/BusinessLayer/DataAccess/Http/DI/di.dart';
import 'package:kma_app/Helper/const/color.dart';
import 'package:kma_app/View/LoginScreen/login_screen.dart';
import 'package:kma_app/View/LoginScreen/login_viewmodel.dart';
import 'package:kma_app/View/Widget/app_bar_default.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Trang Chủ', style: Theme.of(context).textTheme.bodyText2,)
        ],
      )
    );
  }

}