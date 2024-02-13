import 'package:flutter/material.dart';
import 'package:remember_me/pages/caregiver/vr/VrAvatarCompletionPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrEnterNamePage.dart';
import 'package:remember_me/pages/caregiver/vr/VrGuidancePage.dart';

class VrAvatarAlertPageWidget extends StatefulWidget {
  const VrAvatarAlertPageWidget({super.key});
  @override
  _VrAvatarAlertPageWidgetState createState() =>
      _VrAvatarAlertPageWidgetState();
}

class _VrAvatarAlertPageWidgetState extends State<VrAvatarAlertPageWidget> {
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
        child: Stack(children: [
          Center(
              child: Stack(
            children: [
              Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          child: Text("Create Avatar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(top: 20, left: 30, right: 30),
                          child: Text(
                              "RememVR generates avatars representing the patient's cherished individuals. These avatars, combined with location VR, offer the patient an immersive recollection of memories. RememVR assists in safeguarding the continuity of the patient's memories. Please upload photos of the individuals you wish to transform into avatars, ensuring they are captured from various angles.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          VrEnterNamePageWidget(type: 0)));
                            },
                            child: Container(
                                padding: EdgeInsets.only(
                                    top: 10, bottom: 10, left: 60, right: 60),
                                margin: EdgeInsets.only(top: 20),
                                child: Text("Upload Photos",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    )),
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
                                )))
                      ]),
                  width: 288,
                  height: 519,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0x33ffffff)))
            ],
          )),
          Positioned(
              top: 100,
              left: 150,
              child: Image.asset(
                "assets/images/logo1.png",
              )),
          Positioned(
            bottom: 100,
            left: MediaQuery.of(context).size.width * 0.25,
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VrGuidancePageWidget()));
                },
                child: Container(
                    child: Text("Click here for the guidance",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)))),
          )
        ]),
      ),
    );
  }
}
