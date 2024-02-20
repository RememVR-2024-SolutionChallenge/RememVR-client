import 'package:flutter/material.dart';
import 'package:remember_me/pages/caregiver/vr/VrSelectPage.dart';
import 'package:remember_me/pages/carerecipient/home/CaregiversPage.dart';
import 'package:remember_me/pages/carerecipient/vr/VrStartPage.dart';

class HomeMainPageWidget extends StatefulWidget {
  const HomeMainPageWidget({super.key});
  @override
  _HomeMainPageWidgetState createState() => _HomeMainPageWidgetState();
}

class _HomeMainPageWidgetState extends State<HomeMainPageWidget> {
  @override
  void initState() {
    super.initState();
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
                    Text("Anna Waslon",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.white))
                  ],
                )),
            Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Image.asset('assets/images/logo_only.png')),
            Text("You’re doing great\n with your activites.",
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
                        builder: (context) => CaregiversPageWidget()));
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff4C5995),
                  ),
                  margin: EdgeInsets.only(
                    top: 15,
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
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
                          margin: EdgeInsets.fromLTRB(15, 15, 15, 15)),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff4C5995),
                ),
                margin: EdgeInsets.only(
                  top: 15,
                ),
                padding: EdgeInsets.only(
                  top: 10,
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Text("2024.01",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                    Text(
                        "M          T          W          T           F           S           S",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        )),
                    Container(
                        padding:
                            EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                child: Image.asset(
                                    width: 30,
                                    height: 30,
                                    "assets/images/calendar_non_check.png")),
                            Container(
                                width: 30,
                                height: 30,
                                child: Image.asset("assets/images/badge1.png")),
                            Container(
                                width: 30,
                                height: 30,
                                child: Image.asset("assets/images/badge2.png")),
                            Container(
                                width: 30,
                                height: 30,
                                child: Image.asset("assets/images/badge3.png")),
                            Container(
                                width: 30,
                                height: 30,
                                child: Image.asset(
                                    "assets/images/calendar_non_check.png")),
                            Container(
                                width: 30,
                                height: 30,
                                child: Image.asset("assets/images/badge2.png")),
                            Container(
                                width: 30,
                                height: 30,
                                child: Image.asset("assets/images/badge1.png"))
                          ],
                        )),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width * 0.8,
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
                                    destination: VrSelectPageWidget()),
                              )));
                },
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff544B88),
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Image.asset("assets/images/brainy.png",
                              width: 150, height: 150),
                        ),
                        Container(
                            child: Text("Start VR\nExperience\nwith\nBrainy",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700,
                                )))
                      ],
                    )))
          ],
        )),
      ),
    );
  }
}
