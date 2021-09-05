import 'package:ecommerce_test/CategoryWise.dart';
import 'package:ecommerce_test/all_categories.dart';
import 'package:ecommerce_test/home.dart';
import 'package:ecommerce_test/login_screen.dart';
import 'package:ecommerce_test/service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: LoginScreen()),
    );
  }
}
