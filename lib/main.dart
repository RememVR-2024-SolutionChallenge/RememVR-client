import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remember_me/pages/auth/LoginPage.dart';
import 'package:remember_me/pages/auth/TempLoginPage.dart';
import 'package:remember_me/pages/auth/WebviewLoginPage.dart';
import 'package:remember_me/pages/caregiver/home/HomeGiverMainPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrEditPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrAvatarAlertPage.dart';
import 'package:remember_me/pages/caregiver/vr/TempVrEditPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrPlaceAlertPage.dart';
import 'package:remember_me/pages/carerecipient/home/HomeRecipientMainPage.dart';
import 'package:remember_me/pages/carerecipient/vr/VrExperiencePage.dart';
import 'package:remember_me/pages/start/StartPage.dart';
import 'package:remember_me/services/AuthService.dart';
import 'package:remember_me/services/CaregiverService.dart';
import 'package:remember_me/services/CarerecipientService.dart';
import 'package:remember_me/services/TokenService.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AuthService()),
    ChangeNotifierProvider(create: (context) => CaregiverService()),
    ChangeNotifierProvider(create: (context) => CarerecipientService()),
    ChangeNotifierProvider(create: (context) => TokenService()),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "main",
      home: StartPageWidget(),
    );
  }
}
