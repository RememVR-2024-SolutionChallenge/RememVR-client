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
            Container(child: Image.asset('assets/iamges/logo_only.png')),
            Container(
                child: Text("Your Caring Recipient : Anna Waslon",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white))),
            Container(
                child: Text("You’re not alone in this journey.",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white))),
            Container(
                width: 299,
                height: 194,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Daily Quiz Completion Rate",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )),
                    Container(
                        child: Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: Text("Recognition",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        )),
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                          width: 75.21428680419922,
                                          height: 17,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Color(0xff212d78))),
                                      Container(
                                          width: 117,
                                          height: 17,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Color(0x7c212d78)))
                                    ],
                                  )
                                ])),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: Text("Memory",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        )),
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                          width: 101.04545593261719,
                                          height: 17,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Color(0xff291f6b))),
                                      Container(
                                          width: 117,
                                          height: 17,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Color(0x75291f6b)))
                                    ],
                                  )
                                ])),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: Text("Logic",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        )),
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                          width: 57.74026107788086,
                                          height: 17,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Color(0xff1a65a9))),
                                      Container(
                                        width: 117,
                                        height: 17,
                                      )
                                    ],
                                  )
                                ]))
                      ],
                    ))
                  ],
                ))
          ],
        )),
      ),
    );
  }
}
