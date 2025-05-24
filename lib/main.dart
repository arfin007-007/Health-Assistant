import 'package:development/Blood_Bank.dart';
import 'package:development/Find_Doctor.dart';
import 'package:development/IBW_Calculator.dart';
import 'package:development/pages/BMI_Calculator.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(HealthMateApp());
}

class HealthMateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthMate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
