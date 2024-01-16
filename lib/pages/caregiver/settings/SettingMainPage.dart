import 'package:flutter/material.dart';
import 'package:remember_me/pages/caregiver/settings/SettingAboutPage.dart';

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
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SettingAboutPageWidget()));
                      },
                      child: ContentCard(
                        content: "About",
                        color: Color(0xffDCDCE8),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 1,
                      color: Color(0xffDCDCE8),
                    ),
                    ContentCard(
                      content: "Account Info.",
                      color: Color(0xffDCDCE8),
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
                      content: "Notification",
                      color: Color(0xffDCDCE8),
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
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 1,
                      color: Color(0xffDCDCE8),
                    ),
                    ContentCard(
                      content: "Terms of Service",
                      color: Color(0xffDCDCE8),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 1,
                      color: Color(0xffDCDCE8),
                    ),
                    ContentCard(
                      content: "Privacty Policy",
                      color: Color(0xffDCDCE8),
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
  const ContentCard({super.key, required this.content, required this.color});
  final String content;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
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
        ));
  }
}
