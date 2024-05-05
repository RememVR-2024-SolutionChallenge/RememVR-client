import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:remember_me/etc/url.dart';
import 'package:remember_me/model/AuthModel.dart';
import 'package:remember_me/model/UserModel.dart';
import 'package:remember_me/services/TokenService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServerService extends ChangeNotifier {
  bool isConnected = false;
  bool timeout = true;
  Future<void> aiServerCheck() async {
    const timeoutDuration = Duration(seconds: 3);
    try {
      Response response =
          await Dio().get("${baseUrl}/ai").timeout(timeoutDuration);
      if (response.statusCode == 200) {
        isConnected = true;
        print('GET 요청 성공');
      } else {
        print('GET 요청 실패');
        print('Status Code: ${response.statusCode}');
      }
    } on TimeoutException {
      print('요청이 3초 이내에 완료되지 않았습니다.');
      timeout = true;
    } catch (e) {
      print('GET 요청 에러');
      print(e.toString());
    }
  }
}
