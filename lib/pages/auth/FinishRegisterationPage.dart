import 'package:flutter/material.dart';
import 'dart:async';

import 'package:remember_me/pages/auth/SelectUserTypePage.dart';

class FinishRegisterationPageWidget extends StatefulWidget {
  const FinishRegisterationPageWidget({super.key});
  @override
  _FinishRegisterationPageWidgetState createState() =>
      _FinishRegisterationPageWidgetState();
}

class _FinishRegisterationPageWidgetState
    extends State<FinishRegisterationPageWidget> {
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
            child: Container(
          // width: MediaQuery.of(context).size.width * 0.5,
          // height:MediaQuery.of(context),
          child: Text(
            'Care Recipient\nRegistered!',
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
