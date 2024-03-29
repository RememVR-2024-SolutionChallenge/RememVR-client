import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:remember_me/etc/url.dart';
import 'package:remember_me/model/AuthModel.dart';
import 'package:remember_me/model/UserModel.dart';
import 'package:remember_me/services/TokenService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  bool isSuccess = false;
  bool isSend = false;
  bool isVerified = false;
  String htmlCode = "";
  late Tokens userTokens;
  bool isGiver = true;

  Future<void> signUp() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    try {
      Response response = await Dio().get("${baseUrl}/auth/google");
      if (response.statusCode == 200) {
        print('GET 요청 성공');
        htmlCode = response.toString();
        isSuccess = true;
        userTokens = Tokens.fromJson(response.data);
        sharedPreference.setString("access_token", userTokens.accessToken!);
        sharedPreference.setString("refresh_token", userTokens.refreshToken!);
      } else {
        print('GET 요청 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('GET 요청 에러');
      print(e.toString());
    }
  }

  Future<void> enrollInfo(SignUpInfo signUpInfo) async {
    try {
      SharedPreferences sharedPreference =
          await SharedPreferences.getInstance();
      String? token = sharedPreference.getString("access_token");
      Map<String, dynamic> data = signUpInfo.toJson();
      Response response = await Dio().post(
        "${baseUrl}/user/enroll/info",
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 201) {
        print('POST 요청 성공');
        isSuccess = true;
      } else if (response.statusCode == 401) {
        print("ACCESS_TOKEN 만료");
        TokenService().refreshToken();
        enrollInfo(signUpInfo);
      } else {
        print('POST 요청 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('POST 요청 에러');
      print(e.toString());
    }
  }

  Future<void> sendEmail(EmailInfo emailInfo) async {
    try {
      SharedPreferences sharedPreference =
          await SharedPreferences.getInstance();
      String? token = sharedPreference.getString("access_token");
      print("dd" + emailInfo.email!);
      Map<String, dynamic> data = emailInfo.toJson();
      Response response = await Dio().post(
        "${baseUrl}/user/enroll/care/email",
        data: {"email": emailInfo.email!},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 201) {
        print('POST 요청 성공');
        isSend = true;
      } else if (response.statusCode == 401) {
        print("ACCESS_TOKEN 만료");
        TokenService().refreshToken();
        sendEmail(emailInfo);
      } else {
        print('POST 요청 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('POST 요청 에러');
      print(e.toString());
    }
  }

  Future<void> verifyCode(CodeInfo codeInfo) async {
    try {
      SharedPreferences sharedPreference =
          await SharedPreferences.getInstance();
      String? token = sharedPreference.getString("access_token");
      Map<String, dynamic> data = codeInfo.toJson();
      Response response = await Dio().post(
        "${baseUrl}/user/enroll/care/certificate",
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 201) {
        print('POST 요청 성공');
        isVerified = true;
      } else {
        print('POST 요청 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('POST 요청 에러');
      print(e.toString());
    }
  }

  Future<void> checkUser() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String? token = sharedPreferences.getString("access_token");

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
        isGiver = UserInfo.fromJson(response.data).role == "CareRecipient"
            ? false
            : true;
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
