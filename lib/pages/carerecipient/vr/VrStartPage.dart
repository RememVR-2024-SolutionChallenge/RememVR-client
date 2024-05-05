import 'package:flutter/material.dart';
import 'package:remember_me/pages/auth/SetNicknamePage.dart';
import 'package:remember_me/pages/carerecipient/home/HomeRecipientMainPage.dart';
import 'package:remember_me/pages/carerecipient/vr/VrExperiencePage.dart';
import 'package:remember_me/pages/carerecipient/vr/VrSelectPage.dart';

class VrStartPageWidget extends StatefulWidget {
  const VrStartPageWidget({
    super.key,
  });
  @override
  _VrStartPageWidgetState createState() => _VrStartPageWidgetState();
}

class _VrStartPageWidgetState extends State<VrStartPageWidget> {
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
                child: Text(
                    textAlign: TextAlign.center,
                    "Please choose\nVR experience\nfrom your \ngenerated list.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ))),
            SimpleButton(
              type: "start",
              func: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VrSelectPageWidget()));
              },
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeRecipientMainPageWidget()));
                },
                child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text("back to home",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white))))
          ],
        )),
      ),
    );
  }
}
