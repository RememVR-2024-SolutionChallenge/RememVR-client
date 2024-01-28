import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:remember_me/pages/caregiver/settings/SettingAboutPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrQueuePage.dart';
import 'package:remember_me/pages/caregiver/settings/SettingMainPage.dart';

class CaregiversPageWidget extends StatefulWidget {
  const CaregiversPageWidget({super.key});
  @override
  _SettingAccountInfoPageWidgetState createState() =>
      _SettingAccountInfoPageWidgetState();
}

class _SettingAccountInfoPageWidgetState extends State<CaregiversPageWidget> {
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
            TopBar(content: "My Caregivers"),
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
                          role: "Caregiver 1",
                          name: "Seoyoung Kim",
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 1,
                          color: Color(0xffDCDCE8),
                        ),
                        NameCard(
                          role: "Caregiver 2",
                          name: "GuiJung Woo",
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 1,
                          color: Color(0xffDCDCE8),
                        ),
                        NameCard(
                          role: "Caregiver 3",
                          name: "Jinwoo Choi",
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 1,
                          color: Color(0xffDCDCE8),
                        ),
                        NameCard(
                          role: "Caregiver 4",
                          name: "Seoyeon Byeon",
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
