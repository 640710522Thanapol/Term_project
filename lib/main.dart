import 'package:flutter/material.dart';
import 'package:project/login_screen.dart';
import 'period_form_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menstrual Cycle Predictor',
      home: LoginScreen(),
    );
  }
}
