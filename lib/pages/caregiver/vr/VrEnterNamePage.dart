import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remember_me/model/VrModel.dart';
import 'dart:async';

import 'package:remember_me/pages/auth/SelectUserTypePage.dart';
import 'package:remember_me/pages/auth/SetNicknamePage.dart';
import 'package:remember_me/pages/auth/VerifyCodePage.dart';
import 'package:remember_me/pages/caregiver/vr/VrAvatarCompletionPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrMainPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrPlaceCompletionPage.dart';
import 'package:remember_me/services/CaregiverService.dart';

class VrEnterNamePageWidget extends StatefulWidget {
  const VrEnterNamePageWidget(
      {super.key,
      required this.type,
      required this.videoPath,
      required this.imagePath});
  final int type;
  final String videoPath;
  final String imagePath;
  @override
  _VrEnterNamePageWidgetState createState() => _VrEnterNamePageWidgetState();
}

class _VrEnterNamePageWidgetState extends State<VrEnterNamePageWidget> {
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _locationEditingController = TextEditingController();
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  String _gender = "neutral";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CaregiverService>(
        builder: (context, caregiverService, child) {
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
              margin: EdgeInsets.only(top: 15, bottom: 15),
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
                focusNode: _focusNode1,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                controller: _textEditingController,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Color(0xffB0B8D1)),
                    hintStyle: TextStyle(color: Color(0xffDCDCE8)),
                    border: InputBorder.none,
                    hintText: 'location'),
              ),
            ),
            widget.type == 1
                ? Container(
                    margin: EdgeInsets.only(top: 15),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: ShapeDecoration(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
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
                      focusNode: _focusNode2,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      controller: _locationEditingController,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Color(0xffB0B8D1)),
                          hintStyle: TextStyle(color: Color(0xffDCDCE8)),
                          border: InputBorder.none,
                          hintText: 'location'),
                    ),
                  )
                : Row(
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              _gender = "male";
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: ShapeDecoration(
                              color: Color(0xff4C5893),
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
                            child: Text('male'),
                          )),
                      InkWell(
                          onTap: () {
                            setState(() {
                              _gender = "female";
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: ShapeDecoration(
                              color: Color(0xff4C5893),
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
                            child: Text('female'),
                          )),
                      InkWell(
                          onTap: () {
                            setState(() {
                              _gender = "neutral";
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: ShapeDecoration(
                              color: Color(0xff4C5893),
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
                            child: Text('neutral'),
                          ))
                    ],
                  ),
            SimpleButton(
                type: "Upload",
                func: () {
                  if (widget.type == 0) {
                    caregiverService.uploadAvatar(PostAvatar(
                        video: widget.videoPath,
                        image: widget.imagePath,
                        title: _textEditingController.text,
                        gender: _gender));
                  } else {
                    caregiverService.uploadSpace(PostSpace(
                        video: widget.videoPath,
                        title: _textEditingController.text,
                        location: _locationEditingController.text));
                  }
                  //성공적으로 업로드 시
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => widget.type == 0
                              ? VrAvatarCompletionPageWidget()
                              : VrPlaceCompletionPageWidget()));
                }),
          ],
        )),
      ));
    });
  }
}
