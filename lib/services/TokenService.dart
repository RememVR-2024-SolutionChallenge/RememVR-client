import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:remember_me/etc/url.dart';
import 'package:remember_me/model/AuthModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenService extends ChangeNotifier {
  late Tokens newUserTokens;
  void refreshToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      Response response = await Dio().post("${baseUrl}/auth/refresh",
          data: {'refreshToken': sharedPreferences.getString("refresh_token")});
      if (response.statusCode == 201) {
        print("POST 요청 성공");
        newUserTokens = Tokens.fromJson(response.data);

        sharedPreferences.setString("access_token", newUserTokens.accessToken!);
        sharedPreferences.setString(
            "refresh_token", newUserTokens.refreshToken!);
      } else {
        print("POST 요청 실패");
        print("Status Code : ${response.statusCode}");
      }
    } catch (e) {
      print("POST 요청 에러");
      print(e.toString());
    }
  }
}
