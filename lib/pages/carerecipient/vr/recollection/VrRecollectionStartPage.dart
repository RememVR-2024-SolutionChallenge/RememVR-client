import 'package:flutter/material.dart';
import 'package:remember_me/pages/auth/SetNicknamePage.dart';
import 'package:remember_me/pages/carerecipient/home/HomeMainPage.dart';
import 'package:remember_me/pages/carerecipient/vr/VrSelectPage.dart';
import 'package:remember_me/pages/carerecipient/vr/recollection/VrRecollectionQuestionPage.dart';

class VrRecollectionStartPageWidget extends StatefulWidget {
  const VrRecollectionStartPageWidget({super.key});
  @override
  _VrRecollectionStartPageWidgetState createState() =>
      _VrRecollectionStartPageWidgetState();
}

class _VrRecollectionStartPageWidgetState
    extends State<VrRecollectionStartPageWidget> {
  String displayText = "Hello!\nI am your caring \nassistant, Brainy :)";
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => VrRecollectionQuestionPageWidget(type: 0)),
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
                    "Let’s start !",
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
