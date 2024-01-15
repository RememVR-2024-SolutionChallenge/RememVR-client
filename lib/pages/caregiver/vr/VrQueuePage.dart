import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class VrQueuePageWidget extends StatefulWidget {
  const VrQueuePageWidget({super.key});
  @override
  _VrQueuePageWidgetState createState() => _VrQueuePageWidgetState();
}

class _VrQueuePageWidgetState extends State<VrQueuePageWidget> {
  bool isEmpty = false;

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
              child: isEmpty
                  ? Container(
                      child: Text("Your queue is empty.",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          )))
                  : Container(
                      child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: EdgeInsets.only(right: 15, left: 15),
                            child: Row(
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
                                    child: Column(
                                  children: [
                                    Container(
                                      child: Text("Avatar : blalblablabla"),
                                    ),
                                    Container(
                                      child: Text("Space : blablablabla"),
                                    ),
                                    Container(
                                      child: Text(
                                          "Expected time required\n: 40 minutes"),
                                    ),
                                    Container(
                                        child: Text("82/100(%)",
                                            style: TextStyle(
                                              fontSize: 5,
                                              fontWeight: FontWeight.w400,
                                            ))),
                                    LinearPercentIndicator(
                                      padding: EdgeInsets.zero,
                                      percent: 10,
                                      lineHeight: 10,
                                      progressColor: Colors.amber,
                                      backgroundColor: Colors.black,
                                    )
                                  ],
                                ))
                              ],
                            ));
                      },
                    )))),
    );
  }
}
