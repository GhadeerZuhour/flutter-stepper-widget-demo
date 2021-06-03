import 'package:flutter/material.dart';
import 'package:flutter_stepper_demo/splash_screen.dart';
import 'package:flutter_stepper_demo/driverForm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        primarySwatch: Colors.red,
        brightness: Brightness.light,
      ),
    );
  }
}

