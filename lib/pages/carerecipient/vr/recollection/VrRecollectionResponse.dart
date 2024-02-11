import 'package:flutter/material.dart';
import 'package:remember_me/pages/auth/SetNicknamePage.dart';
import 'package:remember_me/pages/carerecipient/home/HomeRecipientMainPage.dart';
import 'package:remember_me/pages/carerecipient/vr/VrSelectPage.dart';
import 'package:remember_me/etc/texts.dart';
import 'package:remember_me/pages/carerecipient/vr/recollection/VrRecollectionQuestionPage.dart';

class VrRecollectionResponsePageWidget extends StatefulWidget {
  const VrRecollectionResponsePageWidget({
    super.key,
    required this.type,
  });
  final int type;
  @override
  _VrRecollectionResponsePageWidgetState createState() =>
      _VrRecollectionResponsePageWidgetState();
}

class _VrRecollectionResponsePageWidgetState
    extends State<VrRecollectionResponsePageWidget> {
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
            GestureDetector(
              onTap: () {
                if (widget.type == 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              VrRecollectionResponsePageWidget(type: 1)));
                } else if (widget.type == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              VrRecollectionQuestionPageWidget(type: 2)));
                } else if (widget.type == 2) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              VrRecollectionResponsePageWidget(type: 3)));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              VrRecollectionQuestionPageWidget(type: 4)));
                }
              },
              child: Container(
                child: Image.asset(
                  "assets/images/brainy.png",
                  width: 350,
                  height: 350,
                ),
              ),
            ),
            Container(
                child: Text(
                    textAlign: TextAlign.center,
                    responses[widget.type],
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
