import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:remember_me/etc/url.dart';
import 'package:remember_me/pages/auth/CompleteSignUpPage.dart';
import 'package:remember_me/services/AuthService.dart';
import 'package:provider/provider.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewLoginPageWidget extends StatefulWidget {
  const WebviewLoginPageWidget({super.key});
  @override
  _WebviewLoginPageWidgetState createState() => _WebviewLoginPageWidgetState();
}

class _WebviewLoginPageWidgetState extends State<WebviewLoginPageWidget> {
  WebViewController controller = WebViewController()
    ..setUserAgent('userAgent')
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (_) {
          print("hello00");
        },
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('${baseUrl}/auth/google')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('${baseUrl}/auth/google'));
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
                padding: EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  "assets/images/logo.png",
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.15,
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
                    await authService.signUp();
                    print(authService.isSuccess);
                    String _htmlCode = authService.htmlCode;
                    if (_isChecked) {
                      if (authService.isSuccess) {
                        print(_htmlCode);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return WebViewWidget(controller: controller);
                            });
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
