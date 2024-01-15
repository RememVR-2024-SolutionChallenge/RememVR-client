import 'package:flutter/material.dart';

class VrAvatarPageWidget extends StatefulWidget {
  const VrAvatarPageWidget({super.key});
  @override
  _VrAvatarPageWidgetState createState() => _VrAvatarPageWidgetState();
}

class _VrAvatarPageWidgetState extends State<VrAvatarPageWidget> {
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
                  child: Column(children: [
                    Text("Create Avatar",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        )),
                    Text(
                        "VR videos can help patients recall past memories. Patients can experience specific periods of an individual's appearance and particular locations in virtual reality. This is based on the effectiveness of reminiscence therapy. Please upload detailed photos of the desired person and specific location photos for implementation in virtual reality.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        )),
                    InkWell(
                        child: Container(
                            child: Text("Continue",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ))))
                  ]),
                  width: 288,
                  height: 469,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0x33ffffff))))),
    );
  }
}
