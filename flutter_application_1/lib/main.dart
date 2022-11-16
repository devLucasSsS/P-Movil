import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/BottomNavCertamen.dart';
import 'package:flutter_application_1/screen/CreateProductCertamen.dart';
import 'package:flutter_application_1/screen/ListProducts.dart';
import 'package:flutter_application_1/screen/Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BottomNav(),
    );
  }
}
