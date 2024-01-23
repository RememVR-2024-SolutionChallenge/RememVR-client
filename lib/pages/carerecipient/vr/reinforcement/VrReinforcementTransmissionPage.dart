import 'package:flutter/material.dart';
import 'package:remember_me/etc/texts.dart';
import 'package:remember_me/pages/auth/SetNicknamePage.dart';
import 'package:remember_me/pages/carerecipient/home/HomeMainPage.dart';
import 'package:remember_me/pages/carerecipient/vr/VrSelectPage.dart';
import 'package:remember_me/pages/carerecipient/vr/recollection/VrRecollectionStartPage.dart';

class VrReinforcementTransmissionPageWidget extends StatefulWidget {
  const VrReinforcementTransmissionPageWidget({super.key});
  @override
  _VrReinforcementTransmissionPageWidgetState createState() =>
      _VrReinforcementTransmissionPageWidgetState();
}

class _VrReinforcementTransmissionPageWidgetState
    extends State<VrReinforcementTransmissionPageWidget> {
  String displayText =
      "Voice recording \ntransmission has\n been successfully\n completed!";
  String displayImage = 'assets/images/background.png';
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        displayText = "You’ve got a badge \nfor today’s task! \nCongrats :)";
        displayImage = 'assets/images/badge1.png';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(displayImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                "assets/images/cloud.png",
                width: 350,
                height: 350,
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                    textAlign: TextAlign.center,
                    displayText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ))),
          ],
        )),
      ),
    );
  }
}
