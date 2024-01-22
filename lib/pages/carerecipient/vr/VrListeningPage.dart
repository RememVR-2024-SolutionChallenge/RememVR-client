import 'package:flutter/material.dart';
import 'package:remember_me/pages/auth/SetNicknamePage.dart';
import 'package:remember_me/pages/carerecipient/home/HomeMainPage.dart';
import 'package:remember_me/pages/carerecipient/vr/VrRecollectionStartPage.dart';
import 'package:remember_me/pages/carerecipient/vr/VrSelectPage.dart';

class VrListeningPageWidget extends StatefulWidget {
  const VrListeningPageWidget({super.key});
  @override
  _VrListeningPageWidgetState createState() => _VrListeningPageWidgetState();
}

class _VrListeningPageWidgetState extends State<VrListeningPageWidget> {
  String displayText = "Hello!\nI am your caring \nassistant, Brainy :)";
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        displayText =
            "I hope the VR \nexperience you had \ntoday was beneficial\n for you.";
      });
    });
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        displayText =
            "Now, I'll ask you a few \nquestions as part of a\n program to enhance \nyour cognitive and \nmemory abilities, \npromoting mental \nwell-being.";
      });
    });
    Future.delayed(Duration(seconds: 6), () {
      setState(() {
        displayText =
            "Feel free to click the \n'Pass' button if any of \nthe questions are \ndifficult for you to \nanswer.";
      });
    });
    Future.delayed(Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => VrRecollectionStartPageWidget()),
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
