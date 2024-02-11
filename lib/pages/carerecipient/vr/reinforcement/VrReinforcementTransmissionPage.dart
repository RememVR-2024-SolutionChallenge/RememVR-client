import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remember_me/etc/texts.dart';
import 'package:remember_me/pages/auth/SetNicknamePage.dart';
import 'package:remember_me/pages/carerecipient/home/HomeRecipientMainPage.dart';
import 'package:remember_me/pages/carerecipient/vr/VrSelectPage.dart';
import 'package:remember_me/pages/carerecipient/vr/recollection/VrRecollectionStartPage.dart';
import 'package:remember_me/services/CarerecipientService.dart';

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
  String displayImage = 'assets/images/cloud.png';
  @override
  void initState() {
    super.initState();
    _requestBadge();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        displayText = "You’ve got a badge \nfor today’s task! \nCongrats :)";
        List<String> badgeImages = ['badge1.png', 'badge2.png', 'badge3.png'];

        Random random = Random();

        int randomIndex = random.nextInt(badgeImages.length);

        String randomImage = badgeImages[randomIndex];
        displayImage = 'assets/images/' + randomImage;
      });
    });
  }

  Future<void> _requestBadge() async {
    await Provider.of<CarerecipientService>(context, listen: false).getBadge();
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
                displayImage,
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
