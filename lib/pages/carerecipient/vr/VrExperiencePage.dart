import 'package:flutter/material.dart';
import 'package:remember_me/pages/auth/SetNicknamePage.dart';
import 'package:remember_me/pages/carerecipient/home/HomeMainPage.dart';
import 'package:remember_me/pages/carerecipient/vr/VrEndPage.dart';
import 'package:remember_me/pages/carerecipient/vr/VrSelectPage.dart';

class VrExperiencePageWidget extends StatefulWidget {
  const VrExperiencePageWidget({super.key});
  @override
  _VrExperiencePageWidgetState createState() => _VrExperiencePageWidgetState();
}

class _VrExperiencePageWidgetState extends State<VrExperiencePageWidget> {
  @override
  bool isPut = true;
  bool isEnd = false;
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
              child: !isEnd
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(isPut
                            ? "assets/images/vr-glass_1.png"
                            : "assets/images/vr-glass_2.png"),
                        Text(
                            isPut
                                ? "Please put on\nthe VR device."
                                : "Currently in\nVR experience",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ))
                      ],
                    )
                  : Stack(children: [
                      AlertDialog(
                        contentPadding: EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        title: Container(
                            padding: EdgeInsets.only(top: 40),
                            alignment: Alignment.center,
                            child: Text("Notification",
                                style: TextStyle(
                                  color: Color(0xff135297),
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700,
                                ))),
                        content: Container(
                          width: 120, // 원하는 폭으로 조절
                          height: 150,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.only(left: 30, right: 30),
                                  child: Text(
                                      "The VR experience time has ended. Please remove the VR device and take some time to answer questions according to Brainy's guidance.",
                                      style: TextStyle(
                                        fontSize: 15,
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
                                  "OK",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              VrEndPageWidget()));
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.22,
                        left: MediaQuery.of(context).size.width * 0.38,
                        child: Image.asset(
                          'assets/images/logo1.png',
                          width: 100,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ]))),
    );
  }
}
