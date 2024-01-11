import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  void SignUp() async {
    try {
      Response response = await Dio().get(
          "https://application-server-n3wk2vhygq-uc.a.run.app/auth/google");
      if (response.statusCode == 200) {
        print('GET 요청 성공');
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
