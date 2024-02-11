import 'package:flutter/material.dart';
import 'package:remember_me/pages/auth/SetNicknamePage.dart';
import 'package:remember_me/pages/carerecipient/home/HomeRecipientMainPage.dart';
import 'package:remember_me/pages/carerecipient/vr/VrSelectPage.dart';
import 'package:remember_me/etc/texts.dart';
import 'package:remember_me/pages/carerecipient/vr/recollection/VrRecollectionRecordPage.dart';

class VrRecollectionQuestionPageWidget extends StatefulWidget {
  const VrRecollectionQuestionPageWidget({super.key, required this.type});
  final int type;
  @override
  _VrRecollectionQuestionPageWidgetState createState() =>
      _VrRecollectionQuestionPageWidgetState();
}

class _VrRecollectionQuestionPageWidgetState
    extends State<VrRecollectionQuestionPageWidget> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                VrRecollectionRecordPageWidget(type: widget.type)),
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
                    questions[widget.type],
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
