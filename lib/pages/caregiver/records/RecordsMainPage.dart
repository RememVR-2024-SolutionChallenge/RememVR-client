import 'package:flutter/material.dart';
import 'package:remember_me/pages/caregiver/records/RecordsViewDetailPage.dart';

class RecordsMainPageWidget extends StatefulWidget {
  const RecordsMainPageWidget({super.key});
  @override
  _RecordsMainPageWidgetState createState() => _RecordsMainPageWidgetState();
}

class _RecordsMainPageWidgetState extends State<RecordsMainPageWidget> {
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
        )),
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
