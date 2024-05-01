import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:remember_me/etc/url.dart';
import 'package:remember_me/model/AuthModel.dart';
import 'package:remember_me/model/BadgeModel.dart';
import 'package:remember_me/model/GroupModel.dart';
import 'package:remember_me/model/UserModel.dart';
import 'package:remember_me/model/VrModel.dart';
import 'package:remember_me/model/VrSampleModel.dart';
import 'package:remember_me/services/TokenService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class CaregiverService extends ChangeNotifier {
  UserInfo user = UserInfo();
  List<Queue> queue = [];
  bool isRecipientExist = false;
  BadgeBundle badgeBundle = BadgeBundle();
  List<VrResources> vrResources = [];
  List<VrResources> vrSampleResources = [];
  bool isSampleLogin = false;

  bool isPost = false;
  GiverGroup recipient = GiverGroup();

  Future<void> getRecipient() async {
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
        recipient = GiverGroup.fromJson(response.data);
      } else if (response.statusCode == 401) {
        print("ACCESS_TOKEN 만료");
        TokenService().refreshToken();
        getRecipient();
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
        user = UserInfo.fromJson(response.data);
        if (user.name == "test_giver") {
          isSampleLogin = true;
        }
        isRecipientExist = true;
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

  Future<void> getAndSaveResources(String uid) async {
    //샘플 포함 전체 VR 자원 불러오기
    final directory = await getApplicationDocumentsDirectory();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString("access_token");

    try {
      Response response = await Dio().get(
        "${baseUrl}/vr-resource",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(response.toString());

        vrResources = (jsonData['vrResources'] as List)
            .map((item) => VrResources.fromJson(item))
            .toList();

        for (int i = 0; i < vrResources.length; i++) {
          String folderName = '';
          Directory vrDirectory = Directory('');
          if (vrResources[i].isSample!) {
            folderName = '${uid}/vr${vrResources[i].id}';
            vrDirectory = Directory('${directory.path}/$folderName');
          } else {
            folderName = 'sample/vr${vrResources[i].id}';
            vrDirectory = Directory('${directory.path}/$folderName');
          }

          if (!vrDirectory.existsSync()) {
            vrDirectory.createSync(recursive: true);
          }

          if (vrResources[i].storageUrls != null) {
            for (var url
                in vrResources[i].storageUrls!.where((url) => url != null)) {
              final response = await http.get(Uri.parse(url!));
              if (response.statusCode == 200) {
                File file = File(path.join(
                    vrDirectory.path, path.basename(url).substring(0, 9)));
                await file.writeAsBytes(response.bodyBytes);
                print(file.path);
              } else {
                print('Failed to download file from $url');
              }
            }
          }
        }
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

  Future<void> getAndSaveSampleResources() async {
    final directory = await getApplicationDocumentsDirectory();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString("access_token");
    try {
      Response response = await Dio().get(
        "${baseUrl}/sample/vr-resource?key=dnrnlwjdghkdlxld",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(response.toString());

        vrSampleResources = (jsonData['vrResources'] as List)
            .map((item) => VrResources.fromJson(item))
            .toList();
        for (int i = 0; i < vrSampleResources.length; i++) {
          String folderName = 'sample/${vrSampleResources[i].id}';
          Directory vrDirectory = Directory('${directory.path}/$folderName');
          if (!vrDirectory.existsSync()) {
            vrDirectory.createSync(recursive: true);
          } else {}

          if (vrSampleResources[i].storageUrls != null) {
            for (var url in vrSampleResources[i]
                .storageUrls!
                .where((url) => url != null)) {
              final response = await http.get(Uri.parse(url!));
              if (response.statusCode == 200) {
                File file = File(path.join(
                    vrDirectory.path, path.basename(url).substring(0, 9)));
                await file.writeAsBytes(response.bodyBytes);
                print(file.path);
              } else {
                print('Failed to download file from $url');
              }
            }
          } else {}
        }
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

  Future<void> getQueue() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString("access_token");

    try {
      Response response = await Dio().get(
        "${baseUrl}/vr-resource/queue",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        queue.clear();
        for (Map<String, dynamic> item in response.data) {
          Queue _queue = Queue.fromJson(item);
          queue.add(_queue);
        }
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

  Future<void> uploadSpace(PostSpace space) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString("access_token");

    FormData formData = FormData.fromMap({
      'video': await MultipartFile.fromFile(space.video!,
          filename: '${space.title}'),
      'title': space.title,
      'location': space.location,
    });
    try {
      Response response = await Dio().post(
        '${baseUrl}/vr-resource/scene',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 201) {
        print('POST 성공');
      } else {
        print('POST 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('POST 요청 에러');
      print(e.toString());
    }
  }

  Future<void> uploadAvatar(PostAvatar avatar) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString("access_token");
    FormData formData = FormData.fromMap({
      'body': await MultipartFile.fromFile(avatar.body!,
          filename: '${avatar.title}'),
      'face': await MultipartFile.fromFile(avatar.face!,
          filename: '${avatar.title}'),
      'title': avatar.title,
      'gender': avatar.gender,
    });
    try {
      Response response = await Dio().post(
        '${baseUrl}/vr-resource/avatar',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 201) {
        print('POST 성공');
      } else {
        print('POST 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('POST 요청 에러');
      print(e.toString());
    }
  }

  Future<void> uploadSampleSpace(PostSampleSpace sampleSpace) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString("access_token");

    FormData formData = FormData.fromMap({
      'video': await MultipartFile.fromFile(sampleSpace.video!,
          filename: '${sampleSpace.title}'),
      'title': sampleSpace.title,
      'location': sampleSpace.location,
      'key': "dnrnlwjdghkdlxld",
    });
    try {
      Response response = await Dio().post(
        '${baseUrl}/sample/scene',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 201) {
        print('POST 성공');
      } else {
        print('POST 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('POST 요청 에러');
      print(e.toString());
    }
  }

  Future<void> uploadSampleAvatar(PostSampleAvatar sampleAvatar) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString("access_token");
    FormData formData = FormData.fromMap({
      'body': await MultipartFile.fromFile(sampleAvatar.body!,
          filename: '${sampleAvatar.title}'),
      'face': await MultipartFile.fromFile(sampleAvatar.face!,
          filename: '${sampleAvatar.title}'),
      'title': sampleAvatar.title,
      'gender': sampleAvatar.gender,
      'key': "dnrnlwjdghkdlxld",
    });
    try {
      Response response = await Dio().post(
        '${baseUrl}/sample/avatar',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 201) {
        print('POST 성공');
      } else {
        print('POST 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('POST 요청 에러');
      print(e.toString());
    }
  }

  Future<String> readAssetFile(String id) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String filePath = '${documentsDirectory.path}/resources/$id/file_0';
    File file = File(filePath);
    if (await file.exists()) {
      return filePath;
    } else {
      return "";
    }
  }

  Future<void> uploadVideo(PostVrVideo vrVideo) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString("access_token");

    Map<String, dynamic> data = {
      "title": "${vrVideo.title}",
      "sceneInfo": {
        "resourceId": "${vrVideo.sceneInfo!.resourceId}",
        "objectData": {
          "scale": {
            "x": vrVideo.sceneInfo!.objectData!.scale!.x,
            "y": vrVideo.sceneInfo!.objectData!.scale!.y,
            "z": vrVideo.sceneInfo!.objectData!.scale!.z
          },
          "position": {
            "x": vrVideo.sceneInfo!.objectData!.position!.x,
            "y": vrVideo.sceneInfo!.objectData!.position!.y,
            "z": vrVideo.sceneInfo!.objectData!.position!.z
          },
          "rotation": {
            "x": vrVideo.sceneInfo!.objectData!.rotation!.x,
            "y": vrVideo.sceneInfo!.objectData!.rotation!.y,
            "z": vrVideo.sceneInfo!.objectData!.rotation!.z,
            "w": vrVideo.sceneInfo!.objectData!.rotation!.w
          }
        }
      },
      "avatarsInfo": [
        {
          "resourceId": "${vrVideo.avatarsInfo![0].resourceId}",
          "objectData": {
            "scale": {
              "x": vrVideo.avatarsInfo![0].objectData!.scale!.x,
              "y": vrVideo.avatarsInfo![0].objectData!.scale!.y,
              "z": vrVideo.avatarsInfo![0].objectData!.scale!.z
            },
            "position": {
              "x": vrVideo.avatarsInfo![0].objectData!.position!.x,
              "y": vrVideo.avatarsInfo![0].objectData!.position!.y,
              "z": vrVideo.avatarsInfo![0].objectData!.position!.z
            },
            "rotation": {
              "x": vrVideo.avatarsInfo![0].objectData!.rotation!.x,
              "y": vrVideo.avatarsInfo![0].objectData!.rotation!.y,
              "z": vrVideo.avatarsInfo![0].objectData!.rotation!.z,
              "w": vrVideo.avatarsInfo![0].objectData!.rotation!.w
            }
          }
        },
      ]
    };
    try {
      Response response = await Dio().post(
        '${baseUrl}/vr-video',
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 201) {
        print('POST 성공');
        isPost = true;
      } else {
        print('POST 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('POST 요청 에러');
      print(e.toString());
    }
  }

  Future<void> uploadSampleVideo(PostVrVideo vrVideo) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString("access_token");

    Map<String, dynamic> data = {
      "title": "${vrVideo.title}",
      "sceneInfo": {
        "resourceId": "${vrVideo.sceneInfo!.resourceId}",
        "objectData": {
          "scale": {
            "x": vrVideo.sceneInfo!.objectData!.scale!.x,
            "y": vrVideo.sceneInfo!.objectData!.scale!.y,
            "z": vrVideo.sceneInfo!.objectData!.scale!.z
          },
          "position": {
            "x": vrVideo.sceneInfo!.objectData!.position!.x,
            "y": vrVideo.sceneInfo!.objectData!.position!.y,
            "z": vrVideo.sceneInfo!.objectData!.position!.z
          },
          "rotation": {
            "x": vrVideo.sceneInfo!.objectData!.rotation!.x,
            "y": vrVideo.sceneInfo!.objectData!.rotation!.y,
            "z": vrVideo.sceneInfo!.objectData!.rotation!.z,
            "w": vrVideo.sceneInfo!.objectData!.rotation!.w
          }
        }
      },
      "avatarsInfo": [
        {
          "resourceId": "${vrVideo.avatarsInfo![0].resourceId}",
          "objectData": {
            "scale": {
              "x": vrVideo.avatarsInfo![0].objectData!.scale!.x,
              "y": vrVideo.avatarsInfo![0].objectData!.scale!.y,
              "z": vrVideo.avatarsInfo![0].objectData!.scale!.z
            },
            "position": {
              "x": vrVideo.avatarsInfo![0].objectData!.position!.x,
              "y": vrVideo.avatarsInfo![0].objectData!.position!.y,
              "z": vrVideo.avatarsInfo![0].objectData!.position!.z
            },
            "rotation": {
              "x": vrVideo.avatarsInfo![0].objectData!.rotation!.x,
              "y": vrVideo.avatarsInfo![0].objectData!.rotation!.y,
              "z": vrVideo.avatarsInfo![0].objectData!.rotation!.z,
              "w": vrVideo.avatarsInfo![0].objectData!.rotation!.w
            }
          }
        },
      ],
      "key": "dnrnlwjdghkdlxld"
    };
    try {
      Response response = await Dio().post(
        '${baseUrl}/vr-video',
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 201) {
        print('POST 성공');
        isPost = true;
      } else {
        print('POST 실패');
        print('Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('POST 요청 에러');
      print(e.toString());
    }
  }
}
