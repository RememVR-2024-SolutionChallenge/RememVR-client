import 'package:flutter/material.dart';
import 'dart:async';

import 'package:remember_me/pages/auth/SelectUserTypePage.dart';
import 'package:remember_me/pages/auth/SetNicknamePage.dart';
import 'package:remember_me/pages/auth/VerifyCodePage.dart';
import 'package:remember_me/pages/caregiver/vr/VrAvatarCompletionPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrMainPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrPlaceCompletionPage.dart';

class VrEnterNamePageWidget extends StatefulWidget {
  const VrEnterNamePageWidget({super.key, required this.type});
  final int type;
  @override
  _VrEnterNamePageWidgetState createState() => _VrEnterNamePageWidgetState();
}

class _VrEnterNamePageWidgetState extends State<VrEnterNamePageWidget> {
  TextEditingController _textEditingController = TextEditingController();
  FocusNode _focusNode = FocusNode();
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
              child: Text(
            "Please enter the \n name of " +
                (widget.type == 0 ? " your Avatar" : "the space"),
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
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: ShapeDecoration(
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(color: Colors.transparent)),
              color: Color(0xff4769A1),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 3),
                  spreadRadius: 0,
                )
              ],
            ),
            child: TextField(
              focusNode: _focusNode,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              controller: _textEditingController,
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Color(0xffB0B8D1)),
                  hintStyle: TextStyle(color: Color(0xffDCDCE8)),
                  border: InputBorder.none,
                  hintText: 'name'),
            ),
          ),
          SimpleButton(
              type: "save",
              destination: widget.type == 0
                  ? VrAvatarCompletionPageWidget()
                  : VrPlaceCompletionPageWidget()),
        ],
      )),
    ));
  }
}
