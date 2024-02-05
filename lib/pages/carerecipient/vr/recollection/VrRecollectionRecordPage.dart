import 'package:flutter/material.dart';
import 'package:remember_me/pages/auth/SetNicknamePage.dart';
import 'package:remember_me/pages/carerecipient/home/HomeMainPage.dart';
import 'package:remember_me/pages/carerecipient/vr/VrSelectPage.dart';
import 'package:remember_me/pages/carerecipient/vr/recollection/VrRecollectionQuestionPage.dart';
import 'package:remember_me/pages/carerecipient/vr/recollection/VrRecollectionResponse.dart';
import 'package:remember_me/pages/carerecipient/vr/reinforcement/VrReinforcementPage.dart';

class VrRecollectionRecordPageWidget extends StatefulWidget {
  const VrRecollectionRecordPageWidget({super.key, required this.type});
  final int type;
  @override
  _VrRecollectionRecordPageWidgetState createState() =>
      _VrRecollectionRecordPageWidgetState();
}

class _VrRecollectionRecordPageWidgetState
    extends State<VrRecollectionRecordPageWidget> {
  @override
  void initState() {
    super.initState();
    print(widget.type);
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
                if (widget.type == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              VrRecollectionResponsePageWidget(type: 0)));
                } else if (widget.type == 3) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              VrRecollectionResponsePageWidget(type: 2)));
                } else if (widget.type == 6) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VrReinforcementPageWidget()));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              VrRecollectionQuestionPageWidget(
                                  type: widget.type + 1)));
                }
              },
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
                    "Listening...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ))),
            Image.asset("assets/images/radio-waves.png"),
            SimpleButton(
                type: "Pass",
                func: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VrRecollectionQuestionPageWidget(
                            type: widget.type + 1),
                      ));
                })
          ],
        )),
      ),
    );
  }
}
