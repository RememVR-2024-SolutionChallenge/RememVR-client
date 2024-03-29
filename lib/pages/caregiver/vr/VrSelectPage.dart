import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remember_me/model/VrModel.dart';
import 'package:remember_me/pages/LoadingPage.dart';
import 'package:remember_me/pages/auth/SetNicknamePage.dart';
import 'package:remember_me/pages/caregiver/vr/VrEditPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrAvatarAlertPage.dart';
import 'package:remember_me/pages/caregiver/vr/TempVrEditPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrPlaceAlertPage.dart';
import 'package:remember_me/services/CaregiverService.dart';

class VrSelectPageWidget extends StatefulWidget {
  const VrSelectPageWidget({super.key});
  @override
  _VrSelectPageWidgetState createState() => _VrSelectPageWidgetState();
}

class _VrSelectPageWidgetState extends State<VrSelectPageWidget> {
  @override
  bool isAvatarSelected = false;
  bool isSpaceSelected = false;
  List<VrResources> _createdAvatars = [];
  List<VrResources> _createdPlaces = [];
  List<VrResources> _createdResources = [];
  VrResources _selectedAvatar = VrResources();
  VrResources _selectedScene = VrResources();
  List<bool> isAvatarClicked = [];
  List<bool> isSceneClicked = [];
  void initState() {
    super.initState();
    _loadCreatedResources();
  }

  Future<void> _loadCreatedResources() async {
    await Provider.of<CaregiverService>(context, listen: false)
        .getAndSaveResources();
    _createdResources =
        Provider.of<CaregiverService>(context, listen: false).vrResources;
    setState(() {
      _createdAvatars.addAll(
          _createdResources.where((resource) => resource.type == 'avatar'));
      isAvatarClicked = List.generate(_createdAvatars.length, (index) => false);

      _createdPlaces.addAll(
          _createdResources.where((resource) => resource.type != 'avatar'));
      isSceneClicked = List.generate(_createdPlaces.length, (index) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(50, 140, 40, 40),
                  child: const Text(
                      "Please choose an avatar and a place VR. If you want to create a new avatar or place VR, please click on the 'Create New' button below each item.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ))),
              Container(
                  child: Column(children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 70),
                  child: const Text("Generated Avatars",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                _createdAvatars.isEmpty
                    ? Text("There is no avatar created.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ))
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: _createdAvatars.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isAvatarClicked[index] =
                                        !isAvatarClicked[index];
                                    isAvatarSelected = !isAvatarSelected;
                                    _selectedAvatar = _createdAvatars[index];
                                  });
                                },
                                child: CreatedAvatarBox(
                                  isClicked: isAvatarClicked[index],
                                  resource: _createdAvatars[index],
                                ));
                          },
                        )),
                SimpleButton(
                    type: "Create New Avatar",
                    func: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VrAvatarAlertPageWidget()));
                    }),
              ])),
              Container(
                margin: EdgeInsets.only(top: 40, bottom: 40),
                color: Color(0xff858EB3),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 4,
              ),
              Container(
                  child: Column(children: [
                Container(
                  margin: EdgeInsets.only(bottom: 70),
                  child: Text("Generated Spaces",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                _createdPlaces.isEmpty
                    ? Text("There is no space created.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ))
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: _createdPlaces.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSceneClicked[index] =
                                        !isSceneClicked[index];
                                    isSpaceSelected = !isSpaceSelected;
                                    _selectedScene = _createdPlaces[index];
                                  });
                                },
                                child: CreatedPlaceBox(
                                    isClicked: isSceneClicked[index],
                                    resource: _createdPlaces[index]));
                          },
                        )),
                SimpleButton(
                    type: "Create New Place VR",
                    func: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VrPlaceAlertPageWidget()));
                    }),
              ])),
              GestureDetector(
                onTap: () {
                  if (!isAvatarSelected || !isSpaceSelected) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Stack(children: [
                            AlertDialog(
                              contentPadding: EdgeInsets.all(10.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              title: Container(
                                  padding: EdgeInsets.only(top: 40),
                                  alignment: Alignment.center,
                                  child: Text("Warning",
                                      style: TextStyle(
                                        color: Color(0xff135297),
                                        fontSize: 23,
                                        fontWeight: FontWeight.w700,
                                      ))),
                              content: Container(
                                width: 120, // 원하는 폭으로 조절
                                height: 100,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        padding: EdgeInsets.only(
                                            left: 30, right: 30),
                                        child: Text(
                                            !isAvatarSelected
                                                ? "Please choose at least 1 avatar generated in the row."
                                                : "Please choose 1 place generated in the row.",
                                            style: TextStyle(
                                              color: Color(0xff135297),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            )))
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                Center(
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      alignment: Alignment.center,
                                      fixedSize: Size(150, 60),
                                      backgroundColor: Color(0xbfae0000),
                                      padding: const EdgeInsets.all(20.0),
                                      textStyle: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "Close",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                )
                              ],
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.25,
                              left: MediaQuery.of(context).size.width * 0.38,
                              child: Image.asset(
                                'assets/images/logo1.png',
                                width: 100,
                                height: 100.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ]);
                        });
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VrEditPageWidget(
                                avatar: _selectedAvatar,
                                scene: _selectedScene)));
                  }
                },
                child: GestureDetector(
                    child: Container(
                        margin: EdgeInsets.only(top: 40, bottom: 40),
                        alignment: Alignment.center,
                        child: Text("Generate New VR",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            )),
                        width: 209,
                        height: 49,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          color: Color(0xff76749F),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 3),
                              spreadRadius: 0,
                            )
                          ],
                        ))),
              )
            ],
          )),
    ));
  }
}

class CreatedAvatarBox extends StatelessWidget {
  const CreatedAvatarBox(
      {super.key, required this.isClicked, required this.resource});
  final bool isClicked;
  final VrResources resource;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.3,
        margin: EdgeInsets.only(right: 15, left: 15),
        child: Column(
          children: [
            Container(
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 20, bottom: 10),
                        child: Image.asset(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.width * 0.2,
                            "assets/images/unknown_woman.png")), //image
                    Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text(resource.title!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            )))
                  ],
                ),
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: isClicked ? Color(0xff4C5893) : Color(0xff9292b7),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 3),
                      spreadRadius: 0,
                    )
                  ],
                )),
          ],
        ));
  }
}

class CreatedPlaceBox extends StatelessWidget {
  const CreatedPlaceBox(
      {super.key, required this.isClicked, required this.resource});
  final bool isClicked;
  final VrResources resource;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.3,
        margin: EdgeInsets.only(right: 15, left: 15),
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 20, bottom: 10),
                        child: Image.asset(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.width * 0.2,
                            "assets/images/play 1.png")),
                    Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text(resource.title!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            )))
                  ],
                ),
                width: MediaQuery.of(context).size.width * 0.35,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: isClicked ? Color(0xff4C5893) : Color(0xff9292b7),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 3),
                      spreadRadius: 0,
                    )
                  ],
                )),
          ],
        ));
  }
}
