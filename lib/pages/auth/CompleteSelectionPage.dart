import 'package:flutter/material.dart';
import 'dart:async';

import 'package:remember_me/pages/auth/SelectUserTypePage.dart';
import 'package:remember_me/pages/auth/SendMailPage.dart';
import 'package:remember_me/pages/auth/SetNicknamePage.dart';

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
          SimpleButton(
              type: "Continue",
              func: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SendMailPageWidget()));
              }),
        ],
      )),
    ));
  }
}
