import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remember_me/model/VrModel.dart';
import 'package:remember_me/pages/caregiver/vr/VrAlertPage.dart';
import 'package:remember_me/pages/caregiver/vr/TempVrEditPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrQueuePage.dart';
import 'package:remember_me/services/CaregiverService.dart';
import 'package:remember_me/services/CarerecipientService.dart';

class VrMainPageWidget extends StatefulWidget {
  const VrMainPageWidget({super.key});
  @override
  _VrMainPageWidgetState createState() => _VrMainPageWidgetState();
}

class _VrMainPageWidgetState extends State<VrMainPageWidget> {
  List<GetVrVideo> _vrVideos = [];
  bool _isRecipientExist = false;

  @override
  void initState() {
    super.initState();
    _loadVrVideos();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    await Provider.of<CaregiverService>(context, listen: false).getUserInfo();
    setState(() {
      _isRecipientExist = Provider.of<CaregiverService>(context, listen: false)
          .isRecipientExist;
    });
  }

  Future<void> _loadVrVideos() async {
    await Provider.of<CarerecipientService>(context, listen: false)
        .getAndSaveAllVrVideos();
    setState(() {
      _vrVideos =
          Provider.of<CarerecipientService>(context, listen: false).vrVideos;
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
          child: _isRecipientExist
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 40),
                          child: Text("Generated videos",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white))),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.35,
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
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _vrVideos.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        margin: EdgeInsets.only(
                                            right: 15, left: 15),
                                        child: Column(
                                          children: [
                                            Container(
                                                child: Image.asset(
                                                  "assets/images/play 1.png",
                                                  width: 78,
                                                  height: 85,
                                                ),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.35,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.25,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Color(0x999292b7))),
                                          ],
                                        ));
                                  },
                                )),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VrAlertPageWidget()));
                          },
                          child: Container(
                              margin: EdgeInsets.only(bottom: 40),
                              alignment: Alignment.center,
                              child: Text("Create New VR Video",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  )),
                              width: 279,
                              height: 49,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: Color(0x33ffffff),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 3),
                                    spreadRadius: 0,
                                  )
                                ],
                              ))),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VrQueuePageWidget()));
                          },
                          child: Container(
                              child: Text("contents in queue",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white))))
                    ],
                  ),
                )
              : Stack(children: [
                  AlertDialog(
                    contentPadding: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    title: Container(
                        padding: EdgeInsets.only(top: 40),
                        alignment: Alignment.center,
                        child: Text("Notice !",
                            style: TextStyle(
                              color: Color(0xff135297),
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                            ))),
                    content: Container(
                      width: 120,
                      height: 240,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Text(
                                "Access to the service is available upon completion of the care recipient's registration.",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xff212C77),
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ))
                        ],
                      ),
                    ),
                    actionsPadding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.2,
                    left: MediaQuery.of(context).size.width * 0.38,
                    child: Image.asset(
                      'assets/images/logo1.png',
                      width: 100,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ])),
    );
  }
}
