import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remember_me/model/AuthModel.dart';
import 'package:remember_me/pages/auth/CompleteSelectionPage.dart';
import 'package:remember_me/pages/carerecipient/home/HomeRecipientMainPage.dart';
import 'package:remember_me/services/AuthService.dart';

class SelectUserTypePageWidget extends StatefulWidget {
  const SelectUserTypePageWidget({super.key, required this.name});
  final String name;
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
    return Consumer<AuthService>(builder: (context, authService, child) {
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
                      onTap: () async {
                        await authService.enrollInfo(
                            SignUpInfo(name: widget.name, role: "CareGiver"));
                        if (authService.isSuccess) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CompleteSelectionPageWidget()));
                        }
                      },
                      child: TypeCard(
                        type: "Caregiver",
                      )),
                  GestureDetector(
                      onTap: () async {
                        await authService.enrollInfo(SignUpInfo(
                            name: widget.name, role: "CareRecipient"));
                        if (authService.isSuccess) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HomeRecipientMainPageWidget()));
                        }
                      },
                      child: TypeCard(
                        type: "Care\nRecipient",
                      ))
                ],
              )
            ],
          )),
        ),
      );
    });
  }
}

class TypeCard extends StatelessWidget {
  const TypeCard({super.key, required this.type});
  final String type;
  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Text(type,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter',
                color: Colors.white)));
  }
}
