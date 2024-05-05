import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:remember_me/model/VrModel.dart';
import 'package:remember_me/pages/carerecipient/vr/VrExperiencePage.dart';
import 'package:remember_me/services/CarerecipientService.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:remember_me/services/FileService.dart';

class VrSelectPageWidget extends StatefulWidget {
  const VrSelectPageWidget({super.key});
  @override
  _VrSelectPageWidgetState createState() => _VrSelectPageWidgetState();
}

class _VrSelectPageWidgetState extends State<VrSelectPageWidget> {
  List<GetVrVideo> _vrVideos = [];
  bool isEmpty = false;
  List<String?> _giverNames = [];
  bool _isSampleLogin = true;

  @override
  void initState() {
    super.initState();
    checkSampleLogin();
    if (_isSampleLogin) {
      _loadSampleVrVideos();
    } else {
      _loadVrVideos();
    }
    printAllFilesInSubfolders(
        '/data/user/0/com.example.remember_me/app_flutter/sample');
  }

  Future _getGivers() async {
    await Provider.of<CarerecipientService>(context, listen: false)
        .getCaregiverGroup();
    setState(() {
      _giverNames = Provider.of<CarerecipientService>(context, listen: false)
          .givergroup
          .givers!
          .map((giver) => giver.name)
          .toList();
    });
  }

  Future<void> checkSampleLogin() async {
    await Provider.of<CarerecipientService>(context, listen: false)
        .getUserInfo();
    _isSampleLogin =
        Provider.of<CarerecipientService>(context, listen: false).isSampleLogin;
  }

  Future<void> _loadVrVideos() async {
    await Provider.of<CarerecipientService>(context, listen: false)
        .getAllVrVideos();
    setState(() {
      _vrVideos =
          Provider.of<CarerecipientService>(context, listen: false).vrVideos;
    });
  }

  Future<void> _loadSampleVrVideos() async {
    await Provider.of<CarerecipientService>(context, listen: false)
        .getSampleVrVideos();
    setState(() {
      _vrVideos = Provider.of<CarerecipientService>(context, listen: false)
          .vrSampleVideos;
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
          child: Center(
              child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(
                    top: 100,
                  ),
                  child: Text("VR Experiences",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ))),
              Expanded(
                  child: _vrVideos.isEmpty
                      ? Center(
                          child: Text("There is no video created.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              )))
                      : ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: _vrVideos.length,
                          itemBuilder: (context, index) {
                            return VrCard(
                              // uid: _giverNames[0],
                              uid: 'aa',
                              //하나의 VrVideos의 id로 바뀌어야 함.
                              video: _vrVideos[index],
                            );
                          },
                        ))
            ],
          ))),
    );
  }
}

class VrCard extends StatelessWidget {
  const VrCard({
    super.key,
    required this.uid,
    required this.video,
  });
  final String? uid;
  final GetVrVideo video;

  @override
  Widget build(BuildContext context) {
    return Consumer<CarerecipientService>(
        builder: (context, carerecipientService, child) {
      return GestureDetector(
          onTap: () async {
            //이 vrvideo에 필요한 vr-resource들이 있는지 check
            //없으면 다운로드

            Future<void> downloadAndSave(
                VrResources resource, String baseDirectory) async {
              final resourceDirectory =
                  Directory(path.join(baseDirectory, resource.id));

              if (!await resourceDirectory.exists()) {
                await resourceDirectory.create(recursive: true);
              }

              if (resource.storageUrls != null) {
                for (var url
                    in resource.storageUrls!.where((url) => url != null)) {
                  final response = await http.get(Uri.parse(url!));
                  if (response.statusCode == 200) {
                    File file = File(path.join(resourceDirectory.path,
                        path.basename(url).substring(0, 9)));
                    await file.writeAsBytes(response.bodyBytes);
                  } else {
                    print('Failed to download file from $url');
                  }
                }
              }
            }

            Future<void> downloadMissingResources(
                GetVrVideo vrVideo, String baseDirectory) async {
              Directory baseDir = Directory(baseDirectory);

              if (!await baseDir.exists()) {
                await baseDir.create(recursive: true);
              }

              if (vrVideo.scene != null &&
                  !await Directory(path.join(baseDirectory, vrVideo.scene!.id))
                      .exists()) {
                await downloadAndSave(vrVideo.scene!, baseDirectory);
              }

              if (vrVideo.avatars != null) {
                for (var avatar in vrVideo.avatars!) {
                  if (avatar != null &&
                      !await Directory(path.join(baseDirectory, avatar.id))
                          .exists()) {
                    await downloadAndSave(avatar, baseDirectory);
                  }
                }
              }
            }

            final directory = await getApplicationDocumentsDirectory();
            downloadMissingResources(video, directory.path + "/${uid}");

            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Stack(children: [
                    AlertDialog(
                      //디렉토리를 생성하는 방식을 함수로 빼고, 삭제하는 로직을 함수로 만들어서 비교 + 둘다 똑같이 만들어지고 삭제되는지 확인
                      contentPadding: EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      title: Container(
                          padding: EdgeInsets.only(top: 40),
                          alignment: Alignment.center,
                          child: Text("Notification",
                              style: TextStyle(
                                color: Color(0xff135297),
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                              ))),
                      content: Container(
                        width: 120, // 원하는 폭으로 조절
                        height: 260,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: Text(
                                    "The VR video viewing will last for 15 minutes. \n\nPlease follow the instructions provided by Brainy to wear your VR device. \n\nWhen the video viewing time is complete, a termination notification message will appear on the UNITY screen.",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff212C77),
                                      fontWeight: FontWeight.w400,
                                    )))
                          ],
                        ),
                      ),
                      actionsPadding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                      actions: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                alignment: Alignment.center,
                                fixedSize: Size(120, 60),
                                backgroundColor: Color(0xffA6A6BD),
                                padding: const EdgeInsets.all(20.0),
                                textStyle: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              child: Text(
                                textAlign: TextAlign.center,
                                "OK",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VrExperiencePageWidget(
                                              videoId: video.id!,
                                            )));
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.15,
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
          },
          child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
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
              margin: EdgeInsets.only(right: 20, left: 20, bottom: 30),
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(26, 28, 26, 28),
                      child: Image.asset(
                        "assets/images/play 1.png",
                        width: 78,
                        height: 85,
                      ),
                      width: MediaQuery.of(context).size.width * 0.28,
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0x999292b7))),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Avatar :",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            video.avatars!.length == 1
                                ? video.avatars![0].title!
                                : video.avatars![0].title! +
                                    ", " +
                                    video.avatars![1].title! +
                                    "...",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      )),
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Space :",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            video.scene!.title!,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      )),
                    ],
                  ))
                ],
              )));
    });
  }
}
