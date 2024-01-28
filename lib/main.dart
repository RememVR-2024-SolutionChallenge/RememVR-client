import 'package:flutter/material.dart';
import 'package:remember_me/pages/auth/CompleteSelectionPage.dart';
import 'package:remember_me/pages/auth/CompleteSignUpPage.dart';
import 'package:remember_me/pages/auth/LoginPage.dart';
import 'package:remember_me/pages/auth/SendMailPage.dart';
import 'package:remember_me/pages/auth/StartPage.dart';
import 'package:remember_me/pages/auth/VerifyCodePage.dart';
import 'package:remember_me/pages/caregiver/CaregiverNavigatonPage.dart';
import 'package:provider/provider.dart';
import 'package:remember_me/pages/caregiver/vr/VrAlertPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrAvatarAlertPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrPlaceAlertPage.dart';
import 'package:remember_me/pages/carerecipient/home/HomeMainPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrMainPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrQueuePage.dart';
import 'package:remember_me/pages/carerecipient/vr/listening/VrListeningPage.dart';
import 'package:remember_me/pages/carerecipient/vr/recollection/VrRecollectionStartPage.dart';
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
      home: HomeMainPageWidget(),
    );
  }
}
