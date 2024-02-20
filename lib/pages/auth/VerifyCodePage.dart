import 'package:flutter/material.dart';
import 'package:remember_me/pages/LoadingPage.dart';
import 'dart:async';

import 'package:remember_me/pages/auth/SelectUserTypePage.dart';
import 'package:remember_me/pages/auth/SetNicknamePage.dart';

class VerifyCodePageWidget extends StatefulWidget {
  const VerifyCodePageWidget({super.key});
  @override
  _VerifyCodePageWidgetState createState() => _VerifyCodePageWidgetState();
}

class _VerifyCodePageWidgetState extends State<VerifyCodePageWidget> {
  List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  @override
  void initState() {
    super.initState();
  }

  void _moveToNextTextField(int currentIndex) {
    if (currentIndex < _focusNodes.length - 1) {
      FocusScope.of(context).requestFocus(_focusNodes[currentIndex + 1]);
    } else {
      FocusScope.of(context).requestFocus(FocusNode());
    }
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
              child: Text(
            "Verification",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFDCDCE8),
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          )),
          Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(
                "Enter 4 digit verification code sent to \n helper@gmail.com in 30 minutes.",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Inter',
                  color: Color(0xFFDCDCE8),
                ),
                textAlign: TextAlign.center,
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                4,
                (index) => Container(
                  decoration: ShapeDecoration(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                    color: Color(0xff49619B),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 3),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, counterText: ""),
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    style: TextStyle(color: Colors.white),
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        _moveToNextTextField(index);
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          SimpleButton(
              type: "Confirm",
              destination: LoadingPageWidget(
                isVideo: false,
              )),
        ],
      )),
    ));
  }
}
