import 'package:flutter/material.dart';
import 'package:remember_me/pages/auth/LoginPage.dart';
import 'package:remember_me/pages/caregiver/settings/SettingAboutPage.dart';
import 'package:remember_me/pages/caregiver/settings/SettingAccoutInfoPage.dart';
import 'package:remember_me/pages/caregiver/settings/SettingHelpAndSupportsPage.dart';
import 'package:remember_me/pages/caregiver/settings/SettingNotificationPrefPage.dart';
import 'package:remember_me/pages/caregiver/settings/SettingPrivacyPolicyPage.dart';
import 'package:remember_me/pages/caregiver/settings/SettingTermOfServicePage.dart';

class SettingPageWidget extends StatefulWidget {
  const SettingPageWidget({super.key});
  @override
  _SettingPageWidgetState createState() => _SettingPageWidgetState();
}

class _SettingPageWidgetState extends State<SettingPageWidget> {
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
        child: Center(
            child: Container(
          padding: EdgeInsets.fromLTRB(20, 80, 20, 0),
          child: Column(children: [
            Container(
                child: Text("Settings",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ))),
            Container(
                margin: EdgeInsets.only(top: 20),
                decoration: ShapeDecoration(
                  color: Color(0xff3D71AA),
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
                    ContentCard(
                      content: "About",
                      color: Color(0xffDCDCE8),
                      destination: SettingAboutPageWidget(),
                    ),
                    SimpleLine(),
                    ContentCard(
                      content: "Account Info.",
                      color: Color(0xffDCDCE8),
                      destination: SettingAccountInfoPageWidget(),
                    ),
                  ],
                )),
            Container(
                margin: EdgeInsets.only(top: 20),
                decoration: ShapeDecoration(
                  color: Color(0xff3D71AA),
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
                    ContentCard(
                      content: "Notification Preferences",
                      color: Color(0xffDCDCE8),
                      destination: SettingNotificationPrefPageWidget(),
                    ),
                  ],
                )),
            Container(
                margin: EdgeInsets.only(top: 20),
                decoration: ShapeDecoration(
                  color: Color(0xff3D71AA),
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
                    ContentCard(
                      content: "Help and Supports",
                      color: Color(0xffDCDCE8),
                      destination: SettingHelpAndSupportsPageWidget(),
                    ),
                    SimpleLine(),
                    ContentCard(
                      content: "Terms of Service",
                      color: Color(0xffDCDCE8),
                      destination: SettingTermOfServicePageWidget(),
                    ),
                    SimpleLine(),
                    ContentCard(
                      content: "Privacty Policy",
                      color: Color(0xffDCDCE8),
                      destination: SettingPrivacyPolicyPageWidget(),
                    ),
                  ],
                )),
            Container(
                margin: EdgeInsets.only(top: 20),
                decoration: ShapeDecoration(
                  color: Color(0xff3D71AA),
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
                    ContentCard(
                      content: "Delete Account",
                      color: Color(0xffF0A5A5),
                    ),
                  ],
                ))
          ]),
        )),
      ),
    );
  }
}

class ContentCard extends StatelessWidget {
  ContentCard(
      {super.key,
      required this.content,
      required this.color,
      this.destination});
  final String content;
  final Color color;
  Widget? destination;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (destination != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => destination!));
          } else {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Stack(children: [
                    AlertDialog(
                      contentPadding: EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      title: Container(
                          padding: EdgeInsets.only(top: 40),
                          alignment: Alignment.center,
                          child: Text("Are you sure?",
                              style: TextStyle(
                                color: Color(0xff135297),
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                              ))),
                      content: Container(
                        width: 120, // 원하는 폭으로 조절
                        height: 200,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: Text(
                                    "If you proceed, all your personal data will be permanently deleted. Are you sure you want to proceed with deleting your account? \n\nSelect 'Confirm' if you wish to delete your account, or 'Cancel' to retain your account.",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff212C77),
                                      fontWeight: FontWeight.w400,
                                    )))
                          ],
                        ),
                      ),
                      actionsPadding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                      actions: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                alignment: Alignment.center,
                                fixedSize: Size(120, 60),
                                backgroundColor: Color(0xffA6A6BD),
                                padding: const EdgeInsets.all(20.0),
                                textStyle: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              child: Text(
                                textAlign: TextAlign.center,
                                "Cancel",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                alignment: Alignment.center,
                                fixedSize: Size(120, 60),
                                backgroundColor: Color(0xbfae0000),
                                padding: const EdgeInsets.all(20.0),
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              child: Text(
                                textAlign: TextAlign.center,
                                "Confirm",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              onPressed: () {
                                //유저 정보 삭제 API 필요
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.18,
                      left: MediaQuery.of(context).size.width * 0.38,
                      child: Image.asset(
                        'assets/images/logo1.png',
                        width: 100,
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ]);
                });
          }
        },
        child: Container(
            padding: EdgeInsets.fromLTRB(30, 20, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(content,
                      style: TextStyle(
                        color: color,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                Container(
                    child: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xffDCDCE8),
                )),
              ],
            )));
  }
}

class SimpleLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 1,
      color: Color(0xffDCDCE8),
    );
  }
}
