import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remember_me/pages/caregiver/records/RecordsViewDetailPage.dart';
import 'package:remember_me/services/CaregiverService.dart';
import 'package:remember_me/services/FileService.dart';

class RecordsMainPageWidget extends StatefulWidget {
  const RecordsMainPageWidget({super.key});
  @override
  _RecordsMainPageWidgetState createState() => _RecordsMainPageWidgetState();
}

class _RecordsMainPageWidgetState extends State<RecordsMainPageWidget> {
  bool _isRecipientExist = false;
  @override
  void initState() {
    super.initState();
  }

  Future<void> _loadUserInfo() async {
    await Provider.of<CaregiverService>(context, listen: false).getUserInfo();
    setState(() {
      _isRecipientExist = Provider.of<CaregiverService>(context, listen: false)
          .isRecipientExist;
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
        child: _isRecipientExist
            ? Center(
                child: Container(
                padding: EdgeInsets.fromLTRB(20, 80, 20, 0),
                child: Column(children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text("Records",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ))),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RecordsViewDetailPageWidget(
                                              outline: RecordCard())));
                            },
                            child: RecordCard());
                      },
                    ),
                  )
                ]),
              ))
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
              ]),
      ),
    );
  }
}

class RecordCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Date : 2024 / 01 / 19",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600)),
                Text("Care Recipient : Anna Waslon",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600))
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Color(0xffB6B9D1),
            )
          ],
        ),
        padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0x33ffffff)));
  }
}
