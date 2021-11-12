import 'package:flutter/material.dart';
import 'package:kma_app/BusinessLayer/DataAccess/Http/DI/di.dart';

import 'View/Screen/SplashScreen/splash_screen.dart';
void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
