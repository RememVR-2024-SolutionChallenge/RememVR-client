import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:remember_me/pages/caregiver/vr/VrEnterNamePage.dart';
import 'package:remember_me/pages/caregiver/vr/VrAvatarGuidancePage.dart';
import 'package:remember_me/pages/caregiver/vr/VrPlaceCompletionPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrPlaceGuidancePage.dart';

class VrPlaceAlertPageWidget extends StatefulWidget {
  const VrPlaceAlertPageWidget({super.key});
  @override
  _VrPlaceAlertPageWidgetState createState() => _VrPlaceAlertPageWidgetState();
}

class _VrPlaceAlertPageWidgetState extends State<VrPlaceAlertPageWidget> {
  String filePath = "";
  bool isSelected = false;
  @override
  void initState() {
    super.initState();
  }

  void selectPlace() async {
    XFile? file = await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (file == null) {
      return;
    }

    setState(() {
      filePath = file.path;
      isSelected = true;
    });
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
                                "RememVR creates VR experiences encapsulating the places intertwined with a patient's memories. We all live with our unique sense of places, as visiting specific locations can evoke memories from particular times. Places in VR will make them feel as if they are physically present in the location.Please upload several photos that showcase distinctive features of the location. The more detailed and specific the images of objects and the place, the better.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                          InkWell(
                              onTap: () {
                                selectPlace();
                                if (isSelected) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              VrEnterNamePageWidget(
                                                  type: 1,
                                                  isVideo: true,
                                                  path: filePath)));
                                }
                              },
                              child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, bottom: 10, left: 60, right: 60),
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text("Upload Videos",
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
            Positioned(
              bottom: 100,
              left: MediaQuery.of(context).size.width * 0.25,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VrPlaceGuidancePageWidget()));
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
          ])),
    );
  }
}
