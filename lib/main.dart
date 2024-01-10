import 'package:flutter/material.dart';
import 'package:remember_me/auth/LoginPage.dart';
import 'package:remember_me/auth/StartPage.dart';
import 'package:remember_me/caregiver/NavigatonPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "main",
      home: NavigationPageWidget(),
    );
  }
}
