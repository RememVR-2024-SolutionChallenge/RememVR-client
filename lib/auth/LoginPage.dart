import 'package:flutter/material.dart';
import 'package:remember_me/auth/CompleteSignUpPage.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});
  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  @override
  bool _isChecked = false;
  void initState() {
    super.initState();
  }

  void check() {
    setState(() {
      _isChecked = !_isChecked;
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
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Image.asset(
                "assets/images/logo.png",
                width: 395,
                height: 110,
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text("Caring Companion\n for your beloved ones",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter'),
                  textAlign: TextAlign.center),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CompleteSignUpPageWidget()));
                },
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/Google__G__logo.png",
                          width: 39,
                          height: 39,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text("Continue with Google",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Inter')))
                      ],
                    ))),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      check();
                    },
                    child: Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: _isChecked
                                ? Colors.transparent
                                : const Color.fromARGB(255, 214, 213, 213),
                            border: Border.all(
                                color: _isChecked
                                    ? Colors.white
                                    : Color(0xffd9d9d9))),
                        child: _isChecked
                            ? Container()
                            : Container(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.check,
                                  color: Colors.black,
                                  size: 15,
                                ))),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                          "Your consent is required for us to process your personal data in accordance with our privacy practices. Please indicate your agreement by ticking the box.",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Inter')))
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
