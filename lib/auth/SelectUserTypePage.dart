import 'package:flutter/material.dart';

class SelectUserTypePageWidget extends StatefulWidget {
  const SelectUserTypePageWidget({super.key});
  @override
  _SelectUserTypePageWidgetState createState() =>
      _SelectUserTypePageWidgetState();
}

class _SelectUserTypePageWidgetState extends State<SelectUserTypePageWidget> {
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
            child: Column(
          children: [
            Text("Select Your Position",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                )),
            Row(
              children: [
                Container(
                    width: 143,
                    height: 237,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white)),
                Container(
                    width: 143,
                    height: 237,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white))
              ],
            )
          ],
        )),
      ),
    );
  }
}
