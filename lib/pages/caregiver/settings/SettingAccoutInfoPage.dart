import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:remember_me/pages/caregiver/settings/SettingAboutPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrQueuePage.dart';
import 'package:remember_me/pages/caregiver/settings/SettingMainPage.dart';

class SettingAccountInfoPageWidget extends StatefulWidget {
  const SettingAccountInfoPageWidget({super.key});
  @override
  _SettingAccountInfoPageWidgetState createState() =>
      _SettingAccountInfoPageWidgetState();
}

class _SettingAccountInfoPageWidgetState
    extends State<SettingAccountInfoPageWidget> {
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
            TopBar(content: "Account Info."),
            Container(
              padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Column(children: [
                Container(
                    margin: EdgeInsets.only(top: 20),
                    decoration: ShapeDecoration(
                      color: Color(0xff425E99),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 3),
                          spreadRadius: 0,
                        )
                      ],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        NameCard(
                          role: "Position",
                          name: "Caregiver",
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 1,
                          color: Color(0xffDCDCE8),
                        ),
                        NameCard(
                          role: "User Name",
                          name: "Seoyoung Kim",
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 1,
                          color: Color(0xffDCDCE8),
                        ),
                        NameCard(
                          role: "Email",
                          name: "ryan0010231@gmail.com",
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 1,
                          color: Color(0xffDCDCE8),
                        ),
                        NameCard(
                          role: "Care Recipient",
                          name: "Anna Watson",
                        ),
                      ],
                    )),
                Container(
                  height: 100,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
