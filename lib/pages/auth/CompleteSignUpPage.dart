import 'package:flutter/material.dart';
import 'dart:async';

import 'package:remember_me/auth/SelectUserTypePage.dart';

class CompleteSignUpPageWidget extends StatefulWidget {
  const CompleteSignUpPageWidget({super.key});
  @override
  _CompleteSignUpPageWidgetState createState() =>
      _CompleteSignUpPageWidgetState();
}

class _CompleteSignUpPageWidgetState extends State<CompleteSignUpPageWidget> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SelectUserTypePageWidget()),
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
            child: SizedBox(
          width: 237,
          height: 33,
          child: Text(
            'Sign-up Completed',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFDCDCE8),
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        )),
      ),
    );
  }
}
