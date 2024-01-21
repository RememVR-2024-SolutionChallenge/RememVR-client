import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:remember_me/pages/caregiver/vr/VrQueuePage.dart';

class RecordsViewDetailPageWidget extends StatefulWidget {
  const RecordsViewDetailPageWidget({super.key, required this.outline});
  final Widget outline;
  @override
  _RecordsViewDetailPageWidgetState createState() =>
      _RecordsViewDetailPageWidgetState();
}

class _RecordsViewDetailPageWidgetState
    extends State<RecordsViewDetailPageWidget> {
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
          child: Column(
            children: [
              TopBar(content: "Daily Records"),
              widget.outline,
              Expanded(
                  child: SingleChildScrollView(
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          margin: EdgeInsets.only(
                            bottom: 20,
                          ),
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0x33ffffff)),
                          child: Text(
                              "Brainy: blablalblablalblablalblablablalblablalbalblablalblalblablalblablalblalblalblal\n\nCare recipient: blablablalbalblablabllalblablalblablablalblabblabllablablalblablalbllablalbblabllablablalblablalbllablalbblabllablablalblablalbllablalblablalblablablalbalblabllabllbalblablablalblalbalblab\n\nBrainy: blabllablablalblablalbllablalbblabllablablalblablalbllablalbblabllablablalblablalbllablalbblabllablablalblablalbllablalb\n\nCare recipient: (pass)\n\nBrainy: blabllablablalblablalbllablalbblabllablablalblablalbllablalbblabllabl\n\nCare recipient: blablablalbalblablabllalblablalblablablalblabblabllablablalblablalbllablalbblabllablablalblablalbllablalbblabllablablalblablalbllablalblablalblablablalbalblabllabllbalblablablalblalbalblabalbllablalbblabllablablalblablalbllablalblablalblablablalbalblabllabllbalblablablalblalbalblab",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              )))))
            ],
          )),
    );
  }
}
