import 'package:flutter/material.dart';
import 'package:remember_me/pages/LoadingPage.dart';

class VrSelectPageWidget extends StatefulWidget {
  const VrSelectPageWidget({super.key});
  @override
  _VrSelectPageWidgetState createState() => _VrSelectPageWidgetState();
}

class _VrSelectPageWidgetState extends State<VrSelectPageWidget> {
  @override
  bool isAvatarSelected = false;
  bool isSpaceSelected = false;
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
                  child: Text(
                      "Please choose an avatar and a space. If you want to create a new avatar or space, please click on the 'Create New' button below each item.",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ))),
              Container(
                  child: Column(
                children: [
                  Text("Generated Avatars",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      )),
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
                                      child: Column(
                                        children: [
                                          Container(), //image
                                          Text("Lucy Weasley",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                              ))
                                        ],
                                      ),
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0x999292b7))),
                                ],
                              ));
                        },
                      )),
                  GestureDetector(
                      child: Container(
                          margin: EdgeInsets.only(bottom: 40),
                          alignment: Alignment.center,
                          child: Text("Create New Avatar",
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
                ],
              )),
              Container(
                  child: Column(
                children: [
                  Text("Generated Spaces",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      )),
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
                                      child: Column(
                                        children: [
                                          Container(), //image
                                          Text("St.Paul's Cathedral",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                              ))
                                        ],
                                      ),
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0x999292b7))),
                                ],
                              ));
                        },
                      )),
                  GestureDetector(
                      child: Container(
                          margin: EdgeInsets.only(bottom: 40),
                          alignment: Alignment.center,
                          child: Text("Create New Place",
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
                ],
              )),
              GestureDetector(
                  onTap: () {
                    if (!isAvatarSelected || !isSpaceSelected) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              title: Column(
                                children: <Widget>[
                                  Text("Warning"),
                                ],
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                      !isAvatarSelected
                                          ? "Please choose at least 1 avatar generated in the row."
                                          : "Please choose 1 place generated in the row.",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ))
                                ],
                              ),
                              actions: <Widget>[
                                TextButton(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(20.0),
                                    foregroundColor: Colors.blue,
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  child: Text("Close"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          });
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoadingPageWidget()));
                    }
                  },
                  child: Container(
                      child: Text("Generate New VR",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ))))
            ],
          ))),
    );
  }
}
