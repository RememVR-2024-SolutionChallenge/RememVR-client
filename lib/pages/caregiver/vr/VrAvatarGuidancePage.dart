import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:remember_me/etc/texts.dart';
import 'package:remember_me/pages/caregiver/vr/VrQueuePage.dart';

class VrAvatarGuidancePageWidget extends StatefulWidget {
  const VrAvatarGuidancePageWidget({super.key});
  @override
  _VrAvatarGuidancePageWidgetState createState() =>
      _VrAvatarGuidancePageWidgetState();
}

class _VrAvatarGuidancePageWidgetState
    extends State<VrAvatarGuidancePageWidget> {
  bool isEmpty = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                TopBar(content: "Guidance for creating Avatar"),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: Text(
                      "You can create avatars in two types: video and image",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(20, 30, 20, 30),
                    padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Color(0xff5A78AA),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 3),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Text("Image",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            )),
                        Container(
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Color(0xff7A82AB),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 3),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          margin: EdgeInsets.fromLTRB(26, 28, 26, 28),
                          child: Image.asset(
                            "assets/images/space.png",
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Text(avatarImageGuide,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                )))
                      ],
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(20, 30, 20, 30),
                    padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Color(0xff5A78AA),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 3),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Text("Video",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            )),
                        Container(
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Color(0xff7A82AB),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 3),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          margin: EdgeInsets.fromLTRB(26, 28, 26, 28),
                          child: Image.asset(
                            "assets/images/space.png",
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Text(avatarVideoGuide,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                )))
                      ],
                    )),
              ],
            )),
      ),
    );
  }
}
