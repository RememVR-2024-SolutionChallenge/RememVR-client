import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:remember_me/etc/url.dart';
import 'package:remember_me/model/AuthModel.dart';
import 'package:remember_me/model/BadgeModel.dart';
import 'package:remember_me/model/GroupModel.dart';
import 'package:remember_me/model/UserModel.dart';
import 'package:remember_me/model/VrModel.dart';
import 'package:remember_me/services/TokenService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;

class CarerecipientService extends ChangeNotifier {
  GiverGroup givergroup = GiverGroup();
  late UserInfo user;
  bool isGiverExist = false;
  BadgeBundle badgeBundle = BadgeBundle();
  List<GetVrVideo> vrVideos = [];
  List<GetVrVideo> vrSampleVideos = [];
  List<VrResources> vrResources = [];
  bool isSampleLogin = false;
  Future<void> getCaregiverGroup() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString("access_token");

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

    String? token = sharedPreferences.getString("access_token");
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
        if (user.name == "test_recipient") {
          isSampleLogin = true;
        } else {
          isSampleLogin = false;
        }
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

    String? token = sharedPreferences.getString("access_token");
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

    String? token = sharedPreferences.getString("access_token");
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

  Future<void> getAndSaveAllVrVideos() async {
    //invideo저장하는 거 추가
    final directory = await getApplicationDocumentsDirectory();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString("access_token");
    try {
      Response response = await Dio().get(
        "${baseUrl}/vr-video",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        vrVideos.clear();
        print('GET 요청 성공');
        for (Map<String, dynamic> item in response.data) {
          GetVrVideo _video = GetVrVideo.fromJson(item);
          String folderName = '${item['id']}';
          Directory videoDirectory = Directory('${directory.path}/$folderName');
          if (!videoDirectory.existsSync()) {
            videoDirectory.createSync(recursive: true);
          } else {}
          String fileName = 'meta-data.json';
          File file = File(path.join(videoDirectory.path, fileName));
          await file.writeAsString(jsonEncode(item), flush: true);
          Dio dio = Dio();
          final String sceneUrl = item['scene']['inVideoPositionFile'];
          String fileName2 = "${item['scene']['id']}.json";
          String filePath = "${videoDirectory.path}/${fileName2}";
          await dio.download(sceneUrl, filePath);
          final List<dynamic> avatars = item['avatars'];
          for (final avatar in avatars) {
            String fileName3 = "${avatar['id']}.json";
            final String avatarUrl = avatar['inVideoPositionFile'];
            final String avatarFilePath = "${videoDirectory.path}/${fileName3}";
            await dio.download(avatarUrl, avatarFilePath);
          }
          print('파일이 성공적으로 다운로드되었습니다: $filePath');
          vrVideos.add(_video);
        }
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

  Future<void> getAndSaveSampleVrVideos() async {
    //invideo저장하는 거 추가
    final directory = await getApplicationDocumentsDirectory();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString("access_token");
    try {
      Response response = await Dio().get(
        "${baseUrl}/sample/vr-video?key=dnrnlwjdghkdlxld",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        vrSampleVideos.clear();
        print('GET 요청 성공');
        for (Map<String, dynamic> item in response.data) {
          GetVrVideo _video = GetVrVideo.fromJson(item);
          String folderName = '${item['id']}';
          Directory videoDirectory = Directory('${directory.path}/$folderName');
          if (!videoDirectory.existsSync()) {
            videoDirectory.createSync(recursive: true);
          } else {}
          String fileName = 'meta-data.json';
          File file = File(path.join(videoDirectory.path, fileName));
          await file.writeAsString(jsonEncode(item), flush: true);
          Dio dio = Dio();
          final String sceneUrl = item['scene']['inVideoPositionFile'];
          String fileName2 = "${item['scene']['id']}.json";
          String filePath = "${videoDirectory.path}/${fileName2}";
          await dio.download(sceneUrl, filePath);
          final List<dynamic> avatars = item['avatars'];
          for (final avatar in avatars) {
            String fileName3 = "${avatar['id']}.json";
            final String avatarUrl = avatar['inVideoPositionFile'];
            final String avatarFilePath = "${videoDirectory.path}/${fileName3}";
            await dio.download(avatarUrl, avatarFilePath);
          }
          print('파일이 성공적으로 다운로드되었습니다: $filePath');
          vrSampleVideos.add(_video);
        }
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
