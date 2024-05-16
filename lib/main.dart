import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remember_me/pages/auth/LoginPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrSelectPage.dart';
import 'package:remember_me/pages/start/StartPage.dart';
import 'package:remember_me/services/AuthService.dart';
import 'package:remember_me/services/CaregiverService.dart';
import 'package:remember_me/services/CarerecipientService.dart';
import 'package:remember_me/services/ServerService.dart';
import 'package:remember_me/services/TokenService.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AuthService()),
    ChangeNotifierProvider(create: (context) => CaregiverService()),
    ChangeNotifierProvider(create: (context) => CarerecipientService()),
    ChangeNotifierProvider(create: (context) => TokenService()),
    ChangeNotifierProvider(create: (context) => ServerService()),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "main",
      home: VrSelectPageWidget(),
    );
  }
}
