import 'package:flutter/material.dart';
import 'dart:async';

import 'package:remember_me/pages/auth/SelectUserTypePage.dart';
import 'package:remember_me/pages/auth/SendMailPage.dart';

class VrPlaceCompletionPageWidget extends StatefulWidget {
  const VrPlaceCompletionPageWidget({super.key});
  @override
  _VrPlaceCompletionPageWidgetState createState() =>
      _VrPlaceCompletionPageWidgetState();
}

class _VrPlaceCompletionPageWidgetState
    extends State<VrPlaceCompletionPageWidget> {
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
            "Your place \nVR will be generated soon.\n\nCheck the contents in queue.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFDCDCE8),
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ],
      )),
    ));
  }
}
