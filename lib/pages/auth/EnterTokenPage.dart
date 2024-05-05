import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:remember_me/etc/url.dart';
import 'package:remember_me/pages/auth/LoginPage.dart';
import 'package:remember_me/pages/auth/CompleteSignUpPage.dart';
import 'package:remember_me/pages/caregiver/CaregiverNavigatonPage.dart';
import 'package:remember_me/pages/caregiver/home/HomeGiverMainPage.dart';
import 'package:remember_me/pages/carerecipient/home/HomeRecipientMainPage.dart';
import 'package:remember_me/services/AuthService.dart';
import 'package:remember_me/services/CaregiverService.dart';
import 'package:remember_me/services/CarerecipientService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnterTokenPageWidget extends StatefulWidget {
  const EnterTokenPageWidget({Key? key}) : super(key: key);

  @override
  _EnterTokenPageWidgetState createState() => _EnterTokenPageWidgetState();
}

class _EnterTokenPageWidgetState extends State<EnterTokenPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? accessToken = "";
  String? refreshToken = "";
  TextEditingController _textEditingController = TextEditingController();
  bool _isGiver = true;
  @override
  void initState() {
    super.initState();
  }

  Future<void> removeResourcesAndVideos(bool isGiver) async {
    String _uid = "";
    List<String> _uids = [];
    final directory = await getApplicationDocumentsDirectory();
    final sampleDir = '${directory.path}';
    if (isGiver) {
      await Provider.of<CaregiverService>(context, listen: false).getUserInfo();
      _uid = Provider.of<CaregiverService>(context, listen: false).user.name!;
      final myDir = '${directory.path}/${_uid}';
      directory.listSync().forEach((entity) {
        if (entity is Directory &&
            entity.path != sampleDir &&
            entity.path != myDir) {
          entity.deleteSync(recursive: true);
        }
      });
    } else {
      await Provider.of<CarerecipientService>(context, listen: false)
          .getCaregiverGroup();
      var givers = Provider.of<CarerecipientService>(context, listen: false)
          .givergroup
          .givers;

      if (givers != null) {
        _uids.addAll(givers.map((giver) => giver.name!).toList());
      }
      final directory = await getApplicationDocumentsDirectory();
      final Set<String> keepDirectories =
          _uids.map((uid) => '${directory.path}/$uid').toSet();

      directory.listSync().forEach((entity) {
        if (entity is Directory &&
            entity.path != sampleDir &&
            !keepDirectories.contains(entity.path)) {
          entity.deleteSync(recursive: true);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(builder: (context, authService, child) {
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
                decoration: ShapeDecoration(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  color: Color(0xff49619B),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 3),
                      spreadRadius: 0,
                    )
                  ],
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.07,
                child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    hintText: 'Just paste json files',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  Map<String, dynamic> jsonMap =
                      json.decode(_textEditingController.text);

                  String accessToken = jsonMap['accessToken'];
                  String refreshToken = jsonMap['refreshToken'];
                  bool isEnrolled = jsonMap['isEnrolled'];

                  if (accessToken == "null") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CompleteSignUpPageWidget()));
                  } else {
                    SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.setString("access_token", accessToken!);
                    sharedPreferences.setString("refresh_token", refreshToken!);

                    if (!isEnrolled) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CompleteSignUpPageWidget()));
                    } else {
                      await authService.checkUser();
                      setState(() {
                        _isGiver = authService.isGiver;
                      });

                      if (_isGiver) {
                        removeResourcesAndVideos(true);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CaregiverNavigationWidget()));
                      } else {
                        removeResourcesAndVideos(true);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomeRecipientMainPageWidget()));
                      }
                    }
                  }
                  //token null이면, completepage로
                  //그렇지 않으면 토큰 저장하고, /user실행후 해당하는 homemainpage로
                },
                child: Text('send'),
              ),
            ],
          )),
        ),
      );
    });
  }
}
