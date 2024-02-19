import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:remember_me/model/VrModel.dart';
import 'package:remember_me/pages/carerecipient/vr/VrExperiencePage.dart';
import 'package:remember_me/services/CarerecipientService.dart';

class VrSelectPageWidget extends StatefulWidget {
  const VrSelectPageWidget({super.key});
  @override
  _VrSelectPageWidgetState createState() => _VrSelectPageWidgetState();
}

class _VrSelectPageWidgetState extends State<VrSelectPageWidget> {
  List<VrVideo> _vrVideos = [];
  bool isEmpty = false;
  // List<Widget> widgetsInQueue = [
  //   VrCard(name: "choi jin woo", space: "Korea University"),
  //   VrCard(name: "choi jin woo", space: "Korea University"),
  //   VrCard(name: "choi jin woo", space: "Korea University"),
  //   VrCard(name: "choi jin woo", space: "Korea University"),
  //   VrCard(name: "choi jin woo", space: "Korea University"),
  // ];
  @override
  void initState() {
    super.initState();
    _loadVrVideos();
  }

  Future<void> _loadVrVideos() async {
    await Provider.of<CarerecipientService>(context, listen: false)
        .getVrVideos();
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
                              name: _vrVideos[index].avatars!.title,
                              space: _vrVideos[index].scene!.title,
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
    required this.name,
    required this.space,
  });
  final String? name;
  final String? space;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Stack(children: [
                  AlertDialog(
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
                              textStyle:
                                  TextStyle(fontSize: 20, color: Colors.black),
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
                                          VrExperiencePageWidget()));
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
                          name!,
                          style: TextStyle(
                              fontSize: 20,
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
                          space!,
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
  }
}
