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
            child: Image.asset(
          "assets/images/logo.png",
          width: 395,
          height: 110,
        )),
      ),
    );
  }
}
