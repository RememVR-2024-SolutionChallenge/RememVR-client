import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:provider/provider.dart';
import 'package:remember_me/etc/url.dart';
import 'package:remember_me/model/VrModel.dart';
import 'package:remember_me/pages/auth/SetNicknamePage.dart';
import 'package:remember_me/pages/caregiver/CaregiverNavigatonPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrAlertPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrCompletionPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrQueuePage.dart';
import 'package:remember_me/pages/carerecipient/home/HomeRecipientMainPage.dart';
import 'package:remember_me/services/CaregiverService.dart';
import 'package:remember_me/services/CarerecipientService.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VrEditPageWidget extends StatefulWidget {
  const VrEditPageWidget(
      {super.key, required this.avatars, required this.scene});
  final List<VrResources> avatars;
  final VrResources scene;
  @override
  _VrEditPageWidgetState createState() => _VrEditPageWidgetState();
}

class _VrEditPageWidgetState extends State<VrEditPageWidget> {
  FocusNode _focusNode1 = FocusNode();
  TextEditingController _textEditingController = TextEditingController();
  bool _isSampleLogin = false;

  Future<void> _launchURL() async {
    try {
      await launchUrl(
        Uri.parse(giverVrUrl),
        customTabsOptions: CustomTabsOptions(
          colorSchemes: CustomTabsColorSchemes.defaults(),
          shareState: CustomTabsShareState.on,
          urlBarHidingEnabled: true,
          showTitle: true,
          closeButton: CustomTabsCloseButton(
            icon: CustomTabsCloseButtonIcons.back,
          ),
        ),
        safariVCOptions: SafariViewControllerOptions(
          barCollapsingEnabled: true,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> checkSampleLogin() async {
    await Provider.of<CaregiverService>(context, listen: false).getUserInfo();
    _isSampleLogin =
        Provider.of<CaregiverService>(context, listen: false).isSampleLogin;
  }

  void _postVideoError(BuildContext con) {
    showDialog(
        context: con,
        builder: (BuildContext context) {
          return Stack(children: [
            AlertDialog(
              contentPadding: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              title: Container(
                  padding: EdgeInsets.only(top: 40),
                  alignment: Alignment.center,
                  child: Text("Error",
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
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Text("Error: cannot build Vr Video",
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
                      textStyle: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Close",
                      style: TextStyle(fontSize: 20, color: Colors.white),
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
  }

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
            SimpleButton(
                type: "Edit",
                func: () {
                  _launchURL();
                }),
            Container(
                margin: EdgeInsets.only(
                  top: 15,
                ),
                child: Text(
                  "Please enter the name of video.",
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
              width: 150,
              height: 50,
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
            SimpleButton(
                type: "Upload",
                func: () async {
                  List<AvatarsInfo> _avatars = [];
                  _avatars = widget.avatars
                      .map((avatar) => AvatarsInfo(
                          resourceId: avatar.id,
                          objectData: ObjectData(
                              scale: Scale(x: 0, y: 0, z: 0),
                              position: Scale(x: 0, y: 0, z: 0),
                              rotation: Rotation(w: 0, x: 0, y: 0, z: 0))))
                      .toList();
                  if (_isSampleLogin) {
                    caregiverService.uploadSampleVideo(PostVrVideo(
                        title: _textEditingController.text,
                        sceneInfo: SceneInfo(
                            resourceId: widget.scene.id,
                            objectData: ObjectData(
                                scale: Scale(
                                  x: 0,
                                  y: 0,
                                  z: 0,
                                ),
                                position: Scale(
                                  x: 0,
                                  y: 0,
                                  z: 0,
                                ),
                                rotation: Rotation(w: 0, x: 0, y: 0, z: 0))),
                        avatarsInfo: _avatars));
                  } else {
                    caregiverService.uploadVideo(PostVrVideo(
                        title: _textEditingController.text,
                        sceneInfo: SceneInfo(
                            resourceId: widget.scene.id,
                            objectData: ObjectData(
                                scale: Scale(
                                  x: 0,
                                  y: 0,
                                  z: 0,
                                ),
                                position: Scale(
                                  x: 0,
                                  y: 0,
                                  z: 0,
                                ),
                                rotation: Rotation(w: 0, x: 0, y: 0, z: 0))),
                        avatarsInfo: _avatars));
                  }
                  if (caregiverService.isPost) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VrCompletionPageWidget()));
                  } else {
                    _postVideoError(context);
                  }
                }),
          ],
        )),
      ));
    });
  }
}
