import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remember_me/model/BadgeModel.dart';
import 'package:remember_me/pages/carerecipient/badge/BadgeCalendarPage.dart';
import 'package:remember_me/services/AuthService.dart';
import 'package:remember_me/services/CaregiverService.dart';

class HomeGiverMainPageWidget extends StatefulWidget {
  const HomeGiverMainPageWidget({super.key});
  @override
  _HomeGiverMainPageWidgetState createState() =>
      _HomeGiverMainPageWidgetState();
}

class _HomeGiverMainPageWidgetState extends State<HomeGiverMainPageWidget> {
  String _userName = "";
  bool _isRecipientExist = false;
  DateTime today = DateTime.now();
  late DateTime startOfWeek;
  List<Badges>? _badgeList = [];
  List<String> thisWeekTypes = ["", "", "", "", "", "", ""];
  @override
  void initState() {
    super.initState();
    _loadUserInfo();
    _loadWeekBadgeList();
    Provider.of<CaregiverService>(context, listen: false).readResources();
  }

  Future<void> _loadUserInfo() async {
    await Provider.of<CaregiverService>(context, listen: false).getUserInfo();
    setState(() {
      _userName =
          Provider.of<CaregiverService>(context, listen: false).user.name!;
      _isRecipientExist = Provider.of<CaregiverService>(context, listen: false)
          .isRecipientExist;
    });
  }

  Future<void> _loadWeekBadgeList() async {
    await Provider.of<CaregiverService>(context, listen: false)
        .getBadgeList(today.year, today.month);
    setState(() {
      _badgeList = Provider.of<CaregiverService>(context, listen: false)
          .badgeBundle
          .badges;
      DateTime thisMonday =
          DateTime(today.year, today.month, today.day - today.weekday + 1);
      thisWeekTypes = List<String>.filled(7, "");

      for (var badge in _badgeList!) {
        var createdAt = DateTime.parse(badge.createdAt!);
        var dayIndex = createdAt.weekday - 1;

        if (createdAt.isAfter(thisMonday) && dayIndex >= 0 && dayIndex < 7) {
          thisWeekTypes[dayIndex] = badge.type!;
        }
      }
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
            child: _isRecipientExist
                ? Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 120, bottom: 40),
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
                          margin: EdgeInsets.only(bottom: 30),
                          child: Image.asset('assets/images/logo_only.png')),
                      Text("You’re not alone in this journey",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                      InkWell(
                        onTap: () {},
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
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
                                  builder: (context) => BadgeCalendarPageWidget(
                                      badges: _badgeList!)));
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    child: Text("Badge Tracker ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                        )),
                                    margin:
                                        EdgeInsets.fromLTRB(15, 15, 15, 15)),
                                Container(
                                    margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ))
                              ],
                            )),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ScoreCard(title: "VR", num: 6),
                              ScoreCard(title: "Records", num: 10),
                              ScoreCard(title: "Days with R.M.", num: 237)
                            ],
                          ))
                    ],
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
      ),
    );
  }
}

class ScoreCard extends StatelessWidget {
  const ScoreCard({super.key, required this.title, required this.num});
  final String title;
  final int num;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xff4C5995),
        ),
        child: Column(
          children: [
            Text(title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                )),
            Text(num.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                ))
          ],
        ));
  }
}
