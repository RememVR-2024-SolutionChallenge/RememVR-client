import 'package:flutter/material.dart';
import 'package:remember_me/pages/auth/CompleteSelectionPage.dart';

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
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Text(
                'Select Your Position',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFDCDCE8),
                  fontSize: 25,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CompleteSelectionPageWidget()));
                    },
                    child: Container(
                        margin: EdgeInsets.only(right: 15),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.38,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff4769A1),
                              Color(0xff4F528E),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 6),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Text("Caregiver",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Inter',
                                color: Colors.white)))),
                Container(
                    margin: EdgeInsets.only(left: 15),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.38,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff4769A1),
                          Color(0xff4F528E),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 6),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Text("Care\nRecipent",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Inter',
                            color: Colors.white))),
              ],
            )
          ],
        )),
      ),
    );
  }
}
