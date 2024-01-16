import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:remember_me/pages/caregiver/vr/VrQueuePage.dart';
import 'package:remember_me/pages/caregiver/settings/SettingMainPage.dart';

class SettingAboutPageWidget extends StatefulWidget {
  const SettingAboutPageWidget({super.key});
  @override
  _SettingAboutPageWidgetState createState() => _SettingAboutPageWidgetState();
}

class _SettingAboutPageWidgetState extends State<SettingAboutPageWidget> {
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                TopBar(content: "About"),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: Column(children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, bottom: 5),
                      alignment: Alignment.centerLeft,
                      child: Text("About Service",
                          style: TextStyle(
                            color: Color(0xffDCDCE8),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0x33dcdce8)),
                        child: Container(
                            padding: EdgeInsets.all(30),
                            child: Text(
                                "blablablablablablalbalbalbalblablalblalblablablalblablablalblabklblablablablablablalbalbalbalblablalblalblablablalblablablalblabklblablablablablablalbalbalbalblablalblalblablablalblablablalblabklblablablablablablalbalbalbalblablalblalblablablalblablablalblabk\n\nblablablablablablalbalbalbalblablalblalblablablalblablablalblabklblablablablablablalbalbalbalblablalblalblablablalblablablalblabklblablablablablablalbalbalbalblablalblalblablablalblablablalblabklblablablablablablalbalbalbalblablalblalblablablalblablablalblabkl",
                                style: TextStyle(
                                  color: Color(0xffDCDCE8),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                )))),
                    Container(
                      padding: EdgeInsets.only(left: 10, bottom: 5, top: 20),
                      alignment: Alignment.centerLeft,
                      child: Text("Team Remember Me",
                          style: TextStyle(
                            color: Color(0xffDCDCE8),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        decoration: ShapeDecoration(
                          color: Color(0xff4B4887),
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
                              role: "FE Engineer",
                              name: "Jinwoo Choi",
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 1,
                              color: Color(0xffDCDCE8),
                            ),
                            NameCard(
                              role: "BE Engineer",
                              name: "GuiJung Woo",
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 1,
                              color: Color(0xffDCDCE8),
                            ),
                            NameCard(
                              role: "AI Engineer",
                              name: "Seoyeon Byeon",
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 1,
                              color: Color(0xffDCDCE8),
                            ),
                            NameCard(
                              role: "UX/UI · PM",
                              name: "Seoyoung Kim",
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
          )),
    );
  }
}

class NameCard extends StatelessWidget {
  const NameCard({super.key, required this.name, required this.role});
  final String name;
  final String role;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(30, 20, 20, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(role,
                  style: TextStyle(
                    color: Color(0xffDCDCE8),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  )),
            ),
            Container(
              child: Text(name,
                  style: TextStyle(
                    color: Color(0xffDCDCE8),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ],
        ));
  }
}
