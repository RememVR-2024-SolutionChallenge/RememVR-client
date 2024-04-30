import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remember_me/model/VrModel.dart';
import 'package:remember_me/model/VrSampleModel.dart';
import 'dart:async';

import 'package:remember_me/pages/auth/SelectUserTypePage.dart';
import 'package:remember_me/pages/auth/SetNicknamePage.dart';
import 'package:remember_me/pages/auth/VerifyCodePage.dart';
import 'package:remember_me/pages/caregiver/vr/VrAvatarCompletionPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrMainPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrPlaceCompletionPage.dart';
import 'package:remember_me/services/AuthService.dart';
import 'package:remember_me/services/CaregiverService.dart';
import 'package:remember_me/services/ServerService.dart';

class VrEnterNamePageWidget extends StatefulWidget {
  const VrEnterNamePageWidget(
      {super.key,
      required this.type,
      required this.bodyPath,
      required this.facePath,
      required this.videoPath});
  final int type;
  final String bodyPath;
  final String facePath;
  final String videoPath;
  @override
  _VrEnterNamePageWidgetState createState() => _VrEnterNamePageWidgetState();
}

class _VrEnterNamePageWidgetState extends State<VrEnterNamePageWidget> {
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _locationEditingController = TextEditingController();
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  String selectedLocation = 'indoor';
  String selectedGender = "male";
  bool _isServerConnected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<CaregiverService, AuthService>(
        builder: (context, caregiverService, authService, child) {
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
              "Please enter the \n name of" +
                  (widget.type == 0 ? " your Avatar" : "the place"),
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
                    hintText: 'name'),
              ),
            ),
            widget.type == 1
                ? DropdownButton<String>(
                    dropdownColor: Color(0xff4769A1),
                    value: selectedLocation,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLocation = newValue!;
                      });
                    },
                    items: <String>['indoor', 'outdoor', 'unbound']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                            width: 100,
                            child: Text(value,
                                style: TextStyle(color: Colors.white)),
                          ));
                    }).toList(),
                  )
                : DropdownButton<String>(
                    dropdownColor: Color(0xff4769A1),
                    value: selectedGender,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedGender = newValue!;
                      });
                    },
                    items: <String>['male', 'female', 'neutral']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                            width: 100,
                            child: Text(value,
                                style: TextStyle(color: Colors.white)),
                          ));
                    }).toList(),
                  ),
            SimpleButton(
                type: "Upload",
                func: () async {
                  await caregiverService.getUserInfo();
                  if (!caregiverService.isSampleLogin) {
                    if (widget.type == 0) {
                      caregiverService.uploadAvatar(PostAvatar(
                          body: widget.bodyPath,
                          face: widget.facePath,
                          title: _textEditingController.text,
                          gender: selectedGender));
                    } else {
                      caregiverService.uploadSpace(PostSpace(
                          video: widget.videoPath,
                          title: _textEditingController.text,
                          location: selectedLocation));
                    }
                  } else {
                    if (widget.type == 0) {
                      caregiverService.uploadSampleAvatar(PostSampleAvatar(
                        body: widget.bodyPath,
                        face: widget.facePath,
                        title: _textEditingController.text,
                        gender: selectedGender,
                      ));
                    } else {
                      caregiverService.uploadSampleSpace(PostSampleSpace(
                        video: widget.videoPath,
                        title: _textEditingController.text,
                        location: selectedLocation,
                      ));
                    }
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
