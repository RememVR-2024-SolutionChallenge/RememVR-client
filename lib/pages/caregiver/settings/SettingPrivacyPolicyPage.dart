import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:remember_me/pages/caregiver/settings/SettingAboutPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrQueuePage.dart';
import 'package:remember_me/pages/caregiver/settings/SettingMainPage.dart';

class SettingPrivacyPolicyPageWidget extends StatefulWidget {
  const SettingPrivacyPolicyPageWidget({super.key});
  @override
  _SettingPrivacyPolicyPageWidgetState createState() =>
      _SettingPrivacyPolicyPageWidgetState();
}

class _SettingPrivacyPolicyPageWidgetState
    extends State<SettingPrivacyPolicyPageWidget> {
  bool isEmpty = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            TopBar(content: "Privacy Policy"),
            Container(
                child: Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.08,
                    ),
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                        "blablablablablablalbalbalbalblablalblalblablablalblablablalblabklblablablablablablalbalbalbalblablalblalblablablalblablablalblabklblablablablablablalbalbalbalblablalblalblablablalblablablalblabklblablablablablablalbalbalbalblablalblalblablablalblablablalblabkl",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ))))
          ],
        ),
      ),
    );
  }
}
