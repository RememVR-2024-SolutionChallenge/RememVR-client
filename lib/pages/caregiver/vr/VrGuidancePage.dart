import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:remember_me/pages/caregiver/vr/VrQueuePage.dart';

class VrGuidancePageWidget extends StatefulWidget {
  const VrGuidancePageWidget({super.key});
  @override
  _VrGuidancePageWidgetState createState() => _VrGuidancePageWidgetState();
}

class _VrGuidancePageWidgetState extends State<VrGuidancePageWidget> {
  bool isEmpty = false;
  List<Widget> widgetsInQueue = [
    AvatarSpaceCard(
        name: "choi jin woo", space: "Korea University", status: "In progress"),
    AvatarCard(name: "choi jin woo", status: "Failed"),
    AvatarSpaceCard(
        name: "choi jin woo", space: "Korea University", status: "Success"),
    SpaceCard(space: "Korea University", status: "Success"),
  ];
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
          child: Column(
            children: [
              TopBar(content: "Guidance for creating Avatar"),
              Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Color(0xff5A78AA),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 3),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                            "Our sample avatar {avatar name} is is created using the following video. ",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            )),
                      ),
                      Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Color(0xff7A82AB),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 3),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        margin: EdgeInsets.fromLTRB(26, 28, 26, 28),
                        child: Image.asset(
                          "assets/images/space.png",
                        ),
                      ),
                    ],
                  )),
              Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Color(0xff5A78AA),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 3),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Text("Notice !",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            )),
                      ),
                      Container(
                          child: Text(
                              "The various poses captured in the video will help us generate more accurate movements for your avatar in the VR experience. \nInstead of uploading photos, please consider recording a new video featuring the person you want to turn into an avatar.",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              )))
                    ],
                  ))
            ],
          )),
    );
  }
}
