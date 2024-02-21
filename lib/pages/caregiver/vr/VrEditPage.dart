import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:provider/provider.dart';
import 'package:remember_me/etc/url.dart';
import 'package:remember_me/model/VrModel.dart';
import 'package:remember_me/pages/auth/SetNicknamePage.dart';
import 'package:remember_me/pages/caregiver/CaregiverNavigatonPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrAlertPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrQueuePage.dart';
import 'package:remember_me/pages/carerecipient/home/HomeRecipientMainPage.dart';
import 'package:remember_me/services/CaregiverService.dart';
import 'package:remember_me/services/CarerecipientService.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VrEditPageWidget extends StatefulWidget {
  const VrEditPageWidget(
      {super.key, required this.avatar, required this.scene});
  final VrResources avatar;
  final VrResources scene;
  @override
  _VrEditPageWidgetState createState() => _VrEditPageWidgetState();
}

class _VrEditPageWidgetState extends State<VrEditPageWidget> {
  FocusNode _focusNode1 = FocusNode();
  TextEditingController _textEditingController = TextEditingController();

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CaregiverService>(
        builder: (child, caregiverService, context) {
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
                  print(widget.avatar.id);
                  print(widget.scene.id);
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
                      avatarsInfo: [
                        AvatarsInfo(
                            resourceId: widget.avatar.id,
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
                                rotation: Rotation(w: 0, x: 0, y: 0, z: 0)))
                      ]));
                }),
          ],
        )),
      ));
    });
  }
}
