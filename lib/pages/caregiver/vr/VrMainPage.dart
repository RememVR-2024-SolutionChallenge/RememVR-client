import 'package:flutter/material.dart';

class VrMainPageWidget extends StatefulWidget {
  const VrMainPageWidget({super.key});
  @override
  _VrMainPageWidgetState createState() => _VrMainPageWidgetState();
}

class _VrMainPageWidgetState extends State<VrMainPageWidget> {
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
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: EdgeInsets.only(right: 15, left: 15),
                            child: Column(
                              children: [
                                Container(
                                    child: Image.asset(
                                      "assets/images/play 1.png",
                                      width: 78,
                                      height: 85,
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    height: MediaQuery.of(context).size.height *
                                        0.25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0x999292b7))),
                                Container(
                                    padding: EdgeInsets.only(
                                      right: 20,
                                      top: 10,
                                    ),
                                    child: Text("Seoyoung Kim,\nHome Town",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white)))
                              ],
                            ));
                      },
                    )),
                GestureDetector(
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0x33ffffff)))),
                GestureDetector(
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
          )),
    );
  }
}
