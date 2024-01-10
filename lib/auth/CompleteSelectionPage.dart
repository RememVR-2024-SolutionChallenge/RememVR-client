import 'package:flutter/material.dart';
import 'dart:async';

import 'package:remember_me/auth/SelectUserTypePage.dart';

class CompleteSelectionPageWidget extends StatefulWidget {
  const CompleteSelectionPageWidget({super.key});
  @override
  _CompleteSelectionPageWidgetState createState() =>
      _CompleteSelectionPageWidgetState();
}

class _CompleteSelectionPageWidgetState
    extends State<CompleteSelectionPageWidget> {
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
          Text(
            'Register your care recipient',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFDCDCE8),
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          GestureDetector(
              child: Container(
                  margin: EdgeInsets.only(top: 15),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: ShapeDecoration(
                    color: Color(0xff4769A1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 3),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Text("Continue",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          color: Colors.white)))),
        ],
      )),
    ));
  }
}
