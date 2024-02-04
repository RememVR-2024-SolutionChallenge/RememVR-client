import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:remember_me/model/AuthModel.dart';
import 'package:remember_me/model/GroupModel.dart';
import 'package:remember_me/model/UserModel.dart';
import 'package:remember_me/services/TokenService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CaregiverService extends ChangeNotifier {
  UserInfo user = UserInfo();

  Future<void> getUserInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // String? token = sharedPreferences.getString("access_token");
    String? token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwNTEyNjg4NzcyMjIzNjYwNTA1MSIsInR5cGUiOiJhY2Nlc3MiLCJpYXQiOjE3MDcwMzI5MzIsImV4cCI6MTcwNzAzNDczMn0.Q39MKqr1D-dvQ4Oz1Tpb6tRTFe1KYnGFS8-UtcXLowc";
    try {
      Response response = await Dio().get(
        "https://application-server-n3wk2vhygq-uc.a.run.app/user",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        user = UserInfo.fromJson(response.data);
      } else if (response.statusCode == 401) {
        print("ACCESS_TOKEN 만료");
        TokenService().refreshToken();
        getUserInfo();
      } else {
        print('GET 요청 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('GET 요청 에러');
      print(e.toString());
    }
  }
}
