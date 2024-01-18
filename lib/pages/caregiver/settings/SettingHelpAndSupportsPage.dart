import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:remember_me/pages/caregiver/settings/SettingAboutPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrQueuePage.dart';
import 'package:remember_me/pages/caregiver/settings/SettingMainPage.dart';

class SettingHelpAndSupportsPageWidget extends StatefulWidget {
  const SettingHelpAndSupportsPageWidget({super.key});
  @override
  _SettingHelpAndSupportsPageWidgetState createState() =>
      _SettingHelpAndSupportsPageWidgetState();
}

class _SettingHelpAndSupportsPageWidgetState
    extends State<SettingHelpAndSupportsPageWidget> {
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
            TopBar(content: "Help and Supports"),
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
                            name: "FAQs",
                            widget: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xffACBCD5),
                            )),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 1,
                          color: Color(0xffDCDCE8),
                        ),
                        WidgetCard(
                            name: "Contact Support",
                            widget: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xffACBCD5),
                            )),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 1,
                          color: Color(0xffDCDCE8),
                        ),
                        WidgetCard(
                            name: "User Guides",
                            widget: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xffACBCD5),
                            )),
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
