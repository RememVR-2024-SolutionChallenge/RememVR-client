import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:remember_me/model/VrModel.dart';
import 'package:remember_me/services/CaregiverService.dart';

class VrQueuePageWidget extends StatefulWidget {
  const VrQueuePageWidget({super.key});
  @override
  _VrQueuePageWidgetState createState() => _VrQueuePageWidgetState();
}

class _VrQueuePageWidgetState extends State<VrQueuePageWidget> {
  bool isEmpty = false;
  List<Queue> _queue = [];

  @override
  void initState() {
    super.initState();
    _loadQueue();
  }

  Future<void> _loadQueue() async {
    await Provider.of<CaregiverService>(context, listen: false).getQueue();
    setState(() {
      _queue = Provider.of<CaregiverService>(context, listen: false).queue;
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
          child: _queue.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TopBar(content: "Contents in Queue"),
                    Center(
                        child: Container(
                            width: 180,
                            child: Text("Your\nqueue \nis empty.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white)))),
                    Container(
                      padding: EdgeInsets.only(top: 80),
                    ),
                  ],
                )
              : Column(
                  children: [
                    TopBar(content: "Contents in Queue"),
                    Expanded(
                        child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _queue.length,
                      itemBuilder: (context, index) {
                        return QueueCard(
                            type: _queue[index].type == "scene"
                                ? "scene"
                                : "avatar",
                            name: _queue[index].title!,
                            status: _queue[index].status!);
                      },
                    ))
                  ],
                )),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.content});
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios, color: Color(0xffDCDCE8)),
            ),
            Container(
                alignment: Alignment.center,
                width: 300,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(content,
                    style: TextStyle(
                      color: Color(0xffDCDCE8),
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ))),
          ],
        ));
  }
}

class ProgressionBar extends StatelessWidget {
  const ProgressionBar({super.key, required this.progress});
  final int progress;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
              width: 160,
              height: 7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xff9292b7))),
          Container(
              width: progress / 100 * 160,
              height: 7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xffc9c9dd)))
        ],
      ),
    );
  }
}

class AvatarSpaceCard extends StatelessWidget {
  const AvatarSpaceCard(
      {super.key,
      required this.name,
      required this.space,
      required this.status});
  final String name;
  final String space;
  final String status;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Color(0xff5A78AA),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 3),
              spreadRadius: 0,
            )
          ],
        ),
        margin: EdgeInsets.only(right: 20, left: 20, bottom: 30),
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(26, 28, 26, 28),
                child: Image.asset(
                  "assets/images/play 1.png",
                  width: 78,
                  height: 85,
                ),
                width: MediaQuery.of(context).size.width * 0.28,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0x999292b7))),
            Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("VR",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    )),
                Container(
                    child: Row(
                  children: [
                    Text(
                      "Avatar : ",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    )
                  ],
                )),
                Container(
                    child: Row(
                  children: [
                    Text(
                      "Space : ",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      space,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    )
                  ],
                )),
                Text(
                  "Status :  ${status}",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w300),
                ),
              ],
            ))
          ],
        ));
  }
}

class QueueCard extends StatelessWidget {
  const QueueCard(
      {super.key,
      required this.type,
      required this.name,
      required this.status});
  final String type;
  final String name;
  final String status;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Color(0xff5A78AA),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 3),
              spreadRadius: 0,
            )
          ],
        ),
        margin: EdgeInsets.only(right: 20, left: 20, bottom: 30),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(type == "avatar" ? "Avatar" : "Place",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  )),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(26, 0, 26, 28),
                  child: Image.asset(
                    type == "avatar"
                        ? "assets/images/unknown_man.png"
                        : "assets/images/space.png",
                    width: MediaQuery.of(context).size.width * 0.28,
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name : ",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          name,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    Text(
                      "Status : ${status}",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ],
                )
              ],
            )
          ],
        ));
  }
}
