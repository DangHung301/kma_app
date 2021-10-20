import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kma_app/View/HomeScreen/home_screen.dart';
import 'package:kma_app/View/LoginScreen/login_screen.dart';
import 'package:kma_app/View/LoginScreen/login_viewmodel.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime(){
    var _duration = const Duration(milliseconds: 2000);
    return Timer(_duration, navigate);
  }

  void navigate(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(LoginViewModel())));
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image(image: AssetImage('assets/image/logo_splash_screen.png'),)),
    );
  }

}