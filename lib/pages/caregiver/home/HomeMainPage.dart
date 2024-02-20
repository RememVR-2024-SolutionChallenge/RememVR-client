import 'package:flutter/material.dart';

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
                    Text("Seoyoung",
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
                          child: Text("Badge Tracker ",
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
                margin: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width * 0.83,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ScoreCard(title: "VR", num: 6),
                    ScoreCard(title: "Records", num: 10),
                    ScoreCard(title: "Days with R.M.", num: 237)
                  ],
                ))
          ],
        )),
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
