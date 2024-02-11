import 'package:flutter/material.dart';
import 'package:remember_me/etc/texts.dart';
import 'package:remember_me/pages/auth/SetNicknamePage.dart';
import 'package:remember_me/pages/carerecipient/home/HomeRecipientMainPage.dart';
import 'package:remember_me/pages/carerecipient/vr/VrSelectPage.dart';
import 'package:remember_me/pages/carerecipient/vr/recollection/VrRecollectionStartPage.dart';
import 'package:remember_me/pages/carerecipient/vr/reinforcement/VrReinforcementTransmissionPage.dart';

class VrReinforcementPageWidget extends StatefulWidget {
  const VrReinforcementPageWidget({super.key});
  @override
  _VrReinforcementPageWidgetState createState() =>
      _VrReinforcementPageWidgetState();
}

class _VrReinforcementPageWidgetState extends State<VrReinforcementPageWidget> {
  String displayText = reinforcementTexts[0];
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        displayText = reinforcementTexts[1];
      });
    });
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        displayText = reinforcementTexts[2];
      });
    });
    Future.delayed(Duration(seconds: 6), () {
      setState(() {
        displayText = reinforcementTexts[3];
      });
    });

    Future.delayed(Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => VrReinforcementTransmissionPageWidget()),
      );
    });
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
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                "assets/images/brainy.png",
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
