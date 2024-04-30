import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:remember_me/etc/url.dart';
import 'package:remember_me/pages/auth/CompleteSignUpPage.dart';
import 'package:remember_me/pages/auth/EnterTokenPage.dart';
import 'package:remember_me/services/AuthService.dart';
import 'package:provider/provider.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:remember_me/services/TokenService.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});
  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  Future<void> _launchURL(BuildContext context) async {
    final url = '$baseUrl/auth/google';

    try {
      await launchUrl(
        Uri.parse(url),
        customTabsOptions: CustomTabsOptions(
          colorSchemes: CustomTabsColorSchemes.defaults(),
          shareState: CustomTabsShareState.on,
          urlBarHidingEnabled: true,
          showTitle: true,
          closeButton: CustomTabsCloseButton(
            icon: CustomTabsCloseButtonIcons.back,
          ),
        ),
        safariVCOptions: SafariViewControllerOptions(
          barCollapsingEnabled: true,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

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
    return Consumer2<TokenService, AuthService>(
        builder: (context, tokenService, authService, child) {
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
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.2,
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
                  onTap: () async {
                    if (_isChecked) {
                      _launchURL(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EnterTokenPageWidget()));
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              title: Column(
                                children: <Widget>[
                                  Text("Confirm Agreement"),
                                ],
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "You should confirm a following agreement to start the service",
                                  ),
                                ],
                              ),
                              actions: <Widget>[
                                TextButton(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(20.0),
                                    foregroundColor: Colors.blue,
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  child: Text("Confirm"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          });
                    }
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
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
                              color: !_isChecked
                                  ? Colors.transparent
                                  : const Color.fromARGB(255, 214, 213, 213),
                              border: Border.all(
                                  color: _isChecked
                                      ? Colors.white
                                      : Color(0xffd9d9d9))),
                          child: !_isChecked
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
    });
  }
}
