import 'package:flutter/material.dart';
import 'package:remember_me/pages/auth/SetNicknamePage.dart';
import 'package:remember_me/pages/carerecipient/home/HomeMainPage.dart';
import 'package:remember_me/pages/carerecipient/vr/VrNotificationPage.dart';
import 'package:remember_me/pages/carerecipient/vr/VrSelectPage.dart';

class VrEndPageWidget extends StatefulWidget {
  const VrEndPageWidget({
    super.key,
  });
  @override
  _VrEndPageWidgetState createState() => _VrEndPageWidgetState();
}

class _VrEndPageWidgetState extends State<VrEndPageWidget> {
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
                "assets/images/brainy.png",
                width: 350,
                height: 350,
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                    textAlign: TextAlign.center,
                    "The VR session has been ended. Press the below ‘Continue’ button to proceed to the interaction session!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ))),
            SimpleButton(
                type: "Continue", destination: VrNotificationPageWidget()),
          ],
        )),
      ),
    );
  }
}
