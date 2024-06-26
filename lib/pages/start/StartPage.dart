import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:remember_me/etc/url.dart';
import 'package:remember_me/pages/auth/LoginPage.dart';
import 'package:remember_me/pages/caregiver/CaregiverNavigatonPage.dart';
import 'package:remember_me/pages/caregiver/home/HomeGiverMainPage.dart';
import 'package:remember_me/pages/carerecipient/home/HomeRecipientMainPage.dart';
import 'package:remember_me/services/AuthService.dart';
import 'package:remember_me/services/TokenService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartPageWidget extends StatefulWidget {
  const StartPageWidget({Key? key}) : super(key: key);

  @override
  _StartPageWidgetState createState() => _StartPageWidgetState();
}

class _StartPageWidgetState extends State<StartPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? accessToken = "";
  String? refreshToken = "";
  bool _isGiver = true;
  bool _isRefreshed = false;
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    accessToken = sharedPreferences.getString("access_token");
    refreshToken = sharedPreferences.getString("refresh_token");
    print("accessToken : $accessToken");
    print("refreshToken : $refreshToken");

    if (accessToken != "" && refreshToken != "") {
      //첫 로그인이 아니라면
      bool isLoggedIn = await _validateAccessToken();
      if (isLoggedIn) {
        await Provider.of<AuthService>(context, listen: false).checkUser();
        setState(() {
          _isGiver = Provider.of<AuthService>(context, listen: false).isGiver;
        });

        Future.delayed(Duration(seconds: 2), () {
          if (_isGiver) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => CaregiverNavigationWidget()));
          } else {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => HomeRecipientMainPageWidget()));
          }
        });
      } else {
        //accessToken 만료O, refreshToken 만료X
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPageWidget()));
      }
    } else {
      //첫 로그인
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPageWidget()));
    }
  }

  Future<bool> _validateAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    accessToken = sharedPreferences.getString("access_token");
    try {
      Response response = await Dio().get(
        "${baseUrl}/user",
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        print("자동 로그인 성공");
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response!.statusCode == 401) {
          await Provider.of<TokenService>(context, listen: false)
              .refreshToken();
          setState(() {
            _isRefreshed =
                Provider.of<TokenService>(context, listen: false).isRefreshed;
          });
          return _isRefreshed ? true : false;
        } else {
          return false;
        }
      } else {
        return false;
      }
    }
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
              child: Image.asset(
                "assets/images/brainy.png",
                width: 350,
                height: 350,
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                    textAlign: TextAlign.center,
                    "Wait for a minute",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ))),
          ],
        )),
      ),
    );
  }
}
