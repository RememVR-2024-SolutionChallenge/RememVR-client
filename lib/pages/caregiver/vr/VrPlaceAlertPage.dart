import 'package:flutter/material.dart';
import 'package:remember_me/pages/caregiver/vr/VrPlaceCompletionPage.dart';

class VrPlaceAlertPageWidget extends StatefulWidget {
  const VrPlaceAlertPageWidget({super.key});
  @override
  _VrPlaceAlertPageWidgetState createState() => _VrPlaceAlertPageWidgetState();
}

class _VrPlaceAlertPageWidgetState extends State<VrPlaceAlertPageWidget> {
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
                            margin: EdgeInsets.only(top: 20),
                            child: Text("Create Place VR",
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
                                "Remember Me creates VR experiences encapsulating the places intertwined with a patient's memories. We all live with our unique sense of places, as visiting specific locations can evoke memories from particular times. Places in VR will make them feel as if they are physically present in the location.Please upload several photos that showcase distinctive features of the location. The more detailed and specific the images of objects and the place, the better.",
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
                                            VrPlaceCompletionPageWidget()));
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
                    height: 559,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0x33ffffff)))
              ],
            )),
            Positioned(
                top: 50,
                left: 150,
                child: Image.asset(
                  "assets/images/logo1.png",
                )),
          ])),
    );
  }
}
