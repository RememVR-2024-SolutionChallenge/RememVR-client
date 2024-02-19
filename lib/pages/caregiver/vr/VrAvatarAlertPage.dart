import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:remember_me/pages/caregiver/vr/VrAvatarCompletionPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrEnterNamePage.dart';
import 'package:remember_me/pages/caregiver/vr/VrAvatarGuidancePage.dart';

class VrAvatarAlertPageWidget extends StatefulWidget {
  const VrAvatarAlertPageWidget({super.key});
  @override
  _VrAvatarAlertPageWidgetState createState() =>
      _VrAvatarAlertPageWidgetState();
}

class _VrAvatarAlertPageWidgetState extends State<VrAvatarAlertPageWidget> {
  String videoFilePath = "";
  String imageFilePath = "";
  bool isImageSelected = false;
  bool isVideoSelected = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> selectAvatarImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (file == null) {
      return;
    }

    setState(() {
      imageFilePath = file.path;
      isImageSelected = true;
    });
  }

  Future<void> selectAvatarVideo() async {
    XFile? file = await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (file == null) {
      return;
    }

    setState(() {
      videoFilePath = file.path;
      isVideoSelected = true;
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
                              "RememVR generates avatars representing the patient's cherished individuals. These avatars, combined with location VR, offer the patient an immersive recollection of memories. RememVR assists in safeguarding the continuity of the patient's memories. Please upload photos and videos of the individuals you wish to transform into avatars, ensuring they are captured from various angles.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                        InkWell(
                            onTap: () async {
                              await selectAvatarImage();
                              await selectAvatarVideo();
                              if (isImageSelected && isVideoSelected) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VrEnterNamePageWidget(
                                                type: 0,
                                                videoPath: videoFilePath,
                                                imagePath: imageFilePath)));
                              }
                            },
                            child: Container(
                                padding: EdgeInsets.only(
                                    top: 10, bottom: 10, left: 20, right: 20),
                                margin: EdgeInsets.only(top: 20),
                                child: Text("Upload Photo and Video",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
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
                                ))),
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
                          builder: (context) => VrAvatarGuidancePageWidget()));
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
