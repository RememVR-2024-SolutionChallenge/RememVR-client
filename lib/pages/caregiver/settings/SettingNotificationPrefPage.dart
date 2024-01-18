import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:remember_me/pages/caregiver/settings/SettingAboutPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrQueuePage.dart';
import 'package:remember_me/pages/caregiver/settings/SettingMainPage.dart';

class SettingNotificationPrefPageWidget extends StatefulWidget {
  const SettingNotificationPrefPageWidget({super.key});
  @override
  _SettingNotificationPrefPageWidgetState createState() =>
      _SettingNotificationPrefPageWidgetState();
}

class _SettingNotificationPrefPageWidgetState
    extends State<SettingNotificationPrefPageWidget> {
  bool switchValue1 = false;
  bool switchValue2 = false;
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
            TopBar(content: "Notification Preferences"),
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
                        WidgetCard(
                          name: "Email notifications",
                          widget: Switch(
                            activeColor: Color(0xff9393B8),
                            value: switchValue1,
                            onChanged: (value) {
                              setState(() {
                                switchValue1 = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 1,
                          color: Color(0xffDCDCE8),
                        ),
                        WidgetCard(
                          name: "Push notifications",
                          widget: Switch(
                            activeColor: Color(0xff9393B8),
                            value: switchValue2,
                            onChanged: (value) {
                              setState(() {
                                switchValue2 = value;
                              });
                            },
                          ),
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

class WidgetCard extends StatelessWidget {
  const WidgetCard({super.key, required this.name, required this.widget});

  final String name;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(30, 20, 20, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(name,
                  style: TextStyle(
                    color: Color(0xffDCDCE8),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  )),
            ),
            Container(
              child: widget,
            ),
          ],
        ));
  }
}
