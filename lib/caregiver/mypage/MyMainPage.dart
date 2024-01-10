import 'package:flutter/material.dart';

class MyMainPageWidget extends StatefulWidget {
  const MyMainPageWidget({super.key});
  @override
  _MyMainPageWidgetState createState() => _MyMainPageWidgetState();
}

class _MyMainPageWidgetState extends State<MyMainPageWidget> {
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
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Image.asset(
          "assets/logo.png",
          width: 395,
          height: 110,
        )),
      ),
    );
  }
}
