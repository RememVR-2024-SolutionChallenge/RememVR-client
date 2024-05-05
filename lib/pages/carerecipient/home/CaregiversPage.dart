import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:remember_me/model/GroupModel.dart';
import 'package:remember_me/pages/caregiver/settings/SettingAboutPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrQueuePage.dart';
import 'package:remember_me/pages/caregiver/settings/SettingMainPage.dart';
import 'package:remember_me/services/CarerecipientService.dart';
import 'package:remember_me/services/FileService.dart';

class CaregiversPageWidget extends StatefulWidget {
  const CaregiversPageWidget({super.key, required this.givers});
  final List<Givers>? givers;
  @override
  _CaregiversPageWidgetState createState() => _CaregiversPageWidgetState();
}

class _CaregiversPageWidgetState extends State<CaregiversPageWidget> {
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
        child: Column(
          children: [
            TopBar(content: "My Caregivers"),
            Container(
              padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: ShapeDecoration(
                    color: Color(0xff425E99),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 3),
                        spreadRadius: 0,
                      )
                    ],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.givers!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          NameCard(
                            role: "Caregiver ${index + 1}",
                            name: widget.givers![index].name!,
                          ),
                          if (index < widget.givers!.length - 1)
                            Divider(
                              height: 1,
                              color: Color(0xffDCDCE8),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
