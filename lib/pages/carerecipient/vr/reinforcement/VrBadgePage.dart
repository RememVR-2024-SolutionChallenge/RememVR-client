import 'package:flutter/material.dart';
import 'package:remember_me/etc/texts.dart';
import 'package:remember_me/pages/auth/SetNicknamePage.dart';
import 'package:remember_me/pages/carerecipient/home/HomeRecipientMainPage.dart';
import 'package:remember_me/pages/carerecipient/vr/VrSelectPage.dart';
import 'package:remember_me/pages/carerecipient/vr/recollection/VrRecollectionStartPage.dart';

class VrBadgePageWidget extends StatefulWidget {
  const VrBadgePageWidget({super.key});
  @override
  _VrBadgePageWidgetState createState() => _VrBadgePageWidgetState();
}

class _VrBadgePageWidgetState extends State<VrBadgePageWidget> {
  String displayText = reinforcementTexts[0];
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
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                "assets/images/badge1.png",
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
            InkWell(
                child: SimpleButton(
              func: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeRecipientMainPageWidget()));
              },
              type: 'Go to home',
            ))
          ],
        )),
      ),
    );
  }
}
