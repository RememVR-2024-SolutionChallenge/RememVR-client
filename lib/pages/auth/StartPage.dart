import 'package:flutter/material.dart';

class StartPageWidget extends StatefulWidget {
  const StartPageWidget({super.key});
  @override
  _StartPageWidgetState createState() => _StartPageWidgetState();
}

class _StartPageWidgetState extends State<StartPageWidget> {
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
