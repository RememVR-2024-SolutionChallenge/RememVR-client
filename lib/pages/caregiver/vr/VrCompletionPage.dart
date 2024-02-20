import 'package:flutter/material.dart';
import 'dart:async';

import 'package:remember_me/pages/auth/SelectUserTypePage.dart';
import 'package:remember_me/pages/auth/SendMailPage.dart';

class VrCompletionPageWidget extends StatefulWidget {
  const VrCompletionPageWidget({super.key});
  @override
  _VrCompletionPageWidgetState createState() => _VrCompletionPageWidgetState();
}

class _VrCompletionPageWidgetState extends State<VrCompletionPageWidget> {
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
            "Your VR video \nwill be generated soon.\n\nCheck the contents in queue.",
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
