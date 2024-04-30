import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remember_me/etc/url.dart';
import 'package:remember_me/model/BadgeModel.dart';
import 'package:remember_me/model/GroupModel.dart';
import 'package:remember_me/pages/caregiver/vr/VrSelectPage.dart';
import 'package:remember_me/pages/carerecipient/badge/BadgeCalendarPage.dart';
import 'package:remember_me/pages/carerecipient/home/CaregiversPage.dart';
import 'package:remember_me/pages/carerecipient/vr/VrStartPage.dart';
import 'package:remember_me/services/CarerecipientService.dart';
import 'package:intl/intl.dart';

class HomeRecipientMainPageWidget extends StatefulWidget {
  const HomeRecipientMainPageWidget({super.key});
  @override
  _HomeRecipientMainPageWidgetState createState() =>
      _HomeRecipientMainPageWidgetState();
}

class _HomeRecipientMainPageWidgetState
    extends State<HomeRecipientMainPageWidget> {
  String _userName = "";
  bool _isGiverExist = false;
  DateTime today = DateTime.now();
  late DateTime startOfWeek;
  List<Badges>? _badgeList = [];
  List<String> thisWeekTypes = ["", "", "", "", "", "", ""];

  List<Givers>? _givers = [];
  @override
  void initState() {
    super.initState();
    _loadUserInfo();
    _loadCareGiversInfo();
    _loadWeekBadgeList();
  }

  Future<void> _loadUserInfo() async {
    await Provider.of<CarerecipientService>(context, listen: false)
        .getUserInfo();
    setState(() {
      _isGiverExist = Provider.of<CarerecipientService>(context, listen: false)
          .isGiverExist;
      _userName =
          Provider.of<CarerecipientService>(context, listen: false).user.name!;
    });
  }

  Future<void> _loadCareGiversInfo() async {
    await Provider.of<CarerecipientService>(context, listen: false)
        .getCaregiverGroup();
    setState(() {
      _givers = Provider.of<CarerecipientService>(context, listen: false)
          .givergroup
          .givers;
    });
  }

  Future<void> _loadWeekBadgeList() async {
    await Provider.of<CarerecipientService>(context, listen: false)
        .getBadgeList(today.year, today.month);
    setState(() {
      _badgeList = Provider.of<CarerecipientService>(context, listen: false)
          .badgeBundle
          .badges;
      DateTime thisMonday =
          DateTime(today.year, today.month, today.day - today.weekday + 1);
      thisWeekTypes = List<String>.filled(7, "");

      for (var badge in _badgeList!) {
        var createdAt = DateTime.parse(badge.createdAt!);
        var dayIndex = createdAt.weekday - 1; // 요일은 1부터 시작하므로 1을 빼줍니다.

        if (createdAt.isAfter(thisMonday) && dayIndex >= 0 && dayIndex < 7) {
          thisWeekTypes[dayIndex] = badge.type!;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    startOfWeek = today.subtract(Duration(days: today.weekday - 1));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: _isGiverExist
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 60, bottom: 20),
                            width: MediaQuery.of(context).size.width * 0.7,
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Hi,",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
                                Text(_userName,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white))
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Image.asset('assets/images/logo_only.png')),
                        Text("You’re doing great\n with your activites",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CaregiversPageWidget(givers: _givers)));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff4C5995),
                              ),
                              margin: EdgeInsets.only(
                                top: 15,
                              ),
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      child: Text("My Caregiver ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700,
                                          )),
                                      margin:
                                          EdgeInsets.fromLTRB(15, 15, 15, 15)),
                                  Container(
                                      margin:
                                          EdgeInsets.fromLTRB(15, 15, 15, 15),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                      ))
                                ],
                              )),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BadgeCalendarPageWidget(
                                              badges: _badgeList!)));
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.85,
                                margin: EdgeInsets.only(
                                  top: 15,
                                ),
                                padding: EdgeInsets.only(
                                  top: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff4C5995),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Text(
                                          "${today.year.toString()}.0${today.month.toString()}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: List.generate(
                                        7,
                                        (index) {
                                          DateTime day = startOfWeek
                                              .add(Duration(days: index));
                                          return DayTile(
                                              date: day,
                                              badgeType: thisWeekTypes[index]);
                                        },
                                      ),
                                    ),
                                  ],
                                ))),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width * 0.85,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VrStartPageWidget(
                                            type: "Start",
                                            destination: VrStartPageWidget(
                                                type: "Continue",
                                                destination:
                                                    VrSelectPageWidget()),
                                          )));
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff544B88),
                                ),
                                width: MediaQuery.of(context).size.width * 0.85,
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: Image.asset(
                                          "assets/images/brainy.png",
                                          width: 150,
                                          height: 150),
                                    ),
                                    Container(
                                        child: Text(
                                            "Start VR\nExperience\nwith\nBrainy",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 23,
                                              fontWeight: FontWeight.w700,
                                            )))
                                  ],
                                )))
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
                                  "Access to the service is available upon completion of the care giver's registration.",
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
      ),
    );
  }
}

class DayTile extends StatelessWidget {
  final DateTime date;
  final String badgeType;

  DayTile({required this.date, required this.badgeType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            DateFormat('E').format(date),
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 4),
          badgeType == ""
              ? Container(width: 30, height: 30)
              : Image.asset("assets/images/${badgeTypes[badgeType]}",
                  width: 30, height: 30)
        ],
      ),
    );
  }
}
