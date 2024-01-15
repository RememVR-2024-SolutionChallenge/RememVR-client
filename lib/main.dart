import 'package:flutter/material.dart';
import 'package:remember_me/pages/auth/CompleteSelectionPage.dart';
import 'package:remember_me/pages/auth/CompleteSignUpPage.dart';
import 'package:remember_me/pages/auth/LoginPage.dart';
import 'package:remember_me/pages/auth/StartPage.dart';
import 'package:remember_me/pages/caregiver/NavigatonPage.dart';
import 'package:provider/provider.dart';
import 'package:remember_me/services/AuthService.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AuthService()),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "main",
      home: LoginPageWidget(),
    );
  }
}
