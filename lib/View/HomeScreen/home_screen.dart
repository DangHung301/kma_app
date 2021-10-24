import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kma_app/BusinessLayer/DataAccess/Http/DI/di.dart';
import 'package:kma_app/Helper/const/color.dart';
import 'package:kma_app/View/LoginScreen/login_screen.dart';
import 'package:kma_app/View/LoginScreen/login_viewmodel.dart';
import 'package:kma_app/View/app_bar_widge.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: GestureDetector(
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(getIt<LoginViewModel>())));
        },
        child: Container(
          color: backgroundColor,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarWidget(),
                Text(
                  'Trang chủ',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
