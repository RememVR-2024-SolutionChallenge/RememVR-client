import 'package:flutter/material.dart';
import 'package:remember_me/pages/caregiver/vr/VrSelectPage.dart';

class VrAlertPageWidget extends StatefulWidget {
  const VrAlertPageWidget({super.key});
  @override
  _VrAlertPageWidgetState createState() => _VrAlertPageWidgetState();
}

class _VrAlertPageWidgetState extends State<VrAlertPageWidget> {
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
                    width: 288,
                    height: 469,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0x33ffffff)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text("Reminiscence therapy",
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
                                "VR videos can help patients recall past memories. Patients can experience specific periods of an individual's appearance and particular locations in virtual reality. This is based on the effectiveness of reminiscence therapy. Please upload detailed photos of the desired person and specific location photos for implementation in virtual reality.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VrSelectPageWidget()));
                              },
                              child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, bottom: 10, left: 60, right: 60),
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text("Continue",
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
                        ]))
              ],
            )),
            Positioned(
                top: 100,
                left: 150,
                child: Image.asset(
                  "assets/images/logo1.png",
                )),
          ])),
    );
  }
}
