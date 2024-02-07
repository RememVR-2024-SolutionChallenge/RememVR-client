import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:remember_me/etc/url.dart';
import 'package:remember_me/model/AuthModel.dart';
import 'package:remember_me/model/BadgeModel.dart';
import 'package:remember_me/model/GroupModel.dart';
import 'package:remember_me/model/UserModel.dart';
import 'package:remember_me/services/TokenService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarerecipientService extends ChangeNotifier {
  GiverGroup givergroup = GiverGroup();
  late UserInfo user;
  bool isGiverExist = false;
  BadgeBundle badgeBundle = BadgeBundle();
  Future<void> getCaregiverGroup() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // String? token = sharedPreferences.getString("access_token");

    try {
      Response response = await Dio().get(
        "${baseUrl}/group",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('GET 요청 성공');
        givergroup = GiverGroup.fromJson(response.data);
      } else if (response.statusCode == 401) {
        print("ACCESS_TOKEN 만료");
        TokenService().refreshToken();
        getCaregiverGroup();
      } else {
        print('GET 요청 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('GET 요청 에러');
      print(e.toString());
    }
  }

  Future<void> getUserInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // String? token = sharedPreferences.getString("access_token");

    try {
      Response response = await Dio().get(
        "${baseUrl}/user",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        print('GET 요청 성공');
        isGiverExist = true;
        user = UserInfo.fromJson(response.data);
      } else if (response.statusCode == 401) {
        print("ACCESS_TOKEN 만료");
        TokenService().refreshToken();
        getUserInfo();
      } else if (response.statusCode == 403) {
        print("caregiver 등록 필요");
      } else {
        print('GET 요청 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('GET 요청 에러');
      print(e.toString());
    }
  }

  Future<void> getBadge() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    try {
      Response response = await Dio().post(
        "${baseUrl}/badge",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 201) {
        print('POST 요청 성공');
        isGiverExist = true;
      } else if (response.statusCode == 401) {
        print("ACCESS_TOKEN 만료");
        TokenService().refreshToken();
        // getBadge();
      } else {
        print('POST 요청 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('POST 요청 에러');
      print(e.toString());
    }
  }

  Future<void> getBadgeList(int year, int month) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    try {
      Response response = await Dio().get(
        "${baseUrl}/badge?year=${year}&month=${month}",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        print('GET 요청 성공');
        badgeBundle = BadgeBundle.fromJson(response.data);
      } else if (response.statusCode == 401) {
        print("ACCESS_TOKEN 만료");
        TokenService().refreshToken();
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
