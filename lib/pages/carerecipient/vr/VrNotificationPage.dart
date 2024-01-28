import 'package:flutter/material.dart';
import 'package:remember_me/pages/auth/SetNicknamePage.dart';
import 'package:remember_me/pages/carerecipient/home/HomeMainPage.dart';
import 'package:remember_me/pages/carerecipient/vr/listening/VrListeningPage.dart';
import 'package:remember_me/pages/carerecipient/vr/VrSelectPage.dart';

class VrNotificationPageWidget extends StatefulWidget {
  const VrNotificationPageWidget({
    super.key,
  });
  @override
  _VrNotificationPageWidgetState createState() =>
      _VrNotificationPageWidgetState();
}

class _VrNotificationPageWidgetState extends State<VrNotificationPageWidget> {
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
          child: Stack(children: [
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
                width: 120,
                height: 280,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Text(
                            "In the interaction session, your story will be recorded. Do you agree?\n\nThe recorded results can be reviewed on the caregiver's voice record verification page. Press the 'I agree' button to join the exciting Q&A session with Brainy right away. \n\nIf you do not agree, there may be limitations on using the service",
                            style: TextStyle(
                              fontSize: 14,
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
                        backgroundColor: Color(0xbfae0000),
                        padding: const EdgeInsets.all(15.0),
                        textStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Disagree",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        alignment: Alignment.center,
                        fixedSize: Size(120, 60),
                        backgroundColor: Color(0xffA6A6BD),
                        padding: const EdgeInsets.all(15.0),
                        textStyle: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Agree",
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
                                builder: (context) => VrListeningPageWidget()));
                      },
                    ),
                  ],
                )
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              left: MediaQuery.of(context).size.width * 0.38,
              child: Image.asset(
                'assets/images/logo1.png',
                width: 100,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),
          ])),
    );
  }
}
