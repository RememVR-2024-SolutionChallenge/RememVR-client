import 'package:flutter/material.dart';

class BelovedMainPageWidget extends StatefulWidget {
  const BelovedMainPageWidget({super.key});
  @override
  _BelovedMainPageWidgetState createState() => _BelovedMainPageWidgetState();
}

class _BelovedMainPageWidgetState extends State<BelovedMainPageWidget> {
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
