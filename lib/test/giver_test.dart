import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:remember_me/etc/url.dart';
import 'package:remember_me/model/AuthModel.dart';
import 'package:remember_me/model/BadgeModel.dart';
import 'package:remember_me/model/GroupModel.dart';
import 'package:remember_me/model/UserModel.dart';
import 'package:remember_me/model/VrModel.dart';
import 'package:remember_me/model/VrSampleModel.dart';
import 'package:remember_me/services/CaregiverService.dart';
import 'package:remember_me/services/TokenService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

// class MockSharedPreferences extends SharedPreferences {
//   @override
//   Future<bool> clear() {
//     // TODO: implement clear
//     throw UnimplementedError();
//   }

//   @override
//   Future<bool> commit() {
//     // TODO: implement commit
//     throw UnimplementedError();
//   }

//   @override
//   Future<bool> remove(String key) {
//     // TODO: implement remove
//     throw UnimplementedError();
//   }

//   @override
//   Future<bool> setValue(String key, bool value) {
//     // TODO: implement setValue
//     throw UnimplementedError();
//   }

//   @override
//   Future<bool> setDouble(String key, double value) {
//     // TODO: implement setDouble
//     throw UnimplementedError();
//   }

//   @override
//   Future<bool> setInt(String key, int value) {
//     // TODO: implement setInt
//     throw UnimplementedError();
//   }

//   @override
//   Future<bool> setString(String key, String value) {
//     // TODO: implement setString
//     throw UnimplementedError();
//   }

//   @override
//   Future<bool> setStringList(String key, List<String> value) {
//     // TODO: implement setStringList
//     throw UnimplementedError();
//   }

//   @override
//   Object? get(String key) {
//     // TODO: implement get
//     throw UnimplementedError();
//   }

//   @override
//   bool? getBool(String key) {
//     // TODO: implement getBool
//     throw UnimplementedError();
//   }

//   @override
//   double? getDouble(String key) {
//     // TODO: implement getDouble
//     throw UnimplementedError();
//   }

//   @override
//   int? getInt(String key) {
//     // TODO: implement getInt
//     throw UnimplementedError();
//   }

//   @override
//   String? getString(String key) {
//     if (key == "access_token") {
//       return "access_token";
//     }
//     return null;
//   }

//   @override
//   List<String>? getStringList(String key) {
//     // TODO: implement getStringList
//     throw UnimplementedError();
//   }

//   @override
//   Set<String> getKeys() {
//     // TODO: implement getKeys
//     throw UnimplementedError();
//   }

//   @override
//   Future<bool> reload() {
//     // TODO: implement reload
//     throw UnimplementedError();
//   }
// }

class MockTokenService extends TokenService {
  @override
  Future<void> refreshToken() async {
    // TODO: implement refreshToken
  }
}

void main() {
  group('CaregiverService', () {
    test('getRecipient', () async {
      SharedPreferences.setMockInitialValues({});
      final service = CaregiverService();
      await service.getRecipient();
      expect(service.recipient.recipient!.name!, isNotNull);
    });

    test('getUserInfo', () async {
      SharedPreferences.setMockInitialValues({});
      final service = CaregiverService();
      await service.getUserInfo();
      expect(service.user.name, isNotNull);
    });

    test('getBadgeList', () async {
      SharedPreferences.setMockInitialValues({});
      final service = CaregiverService();
      await service.getBadgeList(2022, 1);
      expect(service.badgeBundle.badges, isNotNull);
    });

    test('getAndSaveResources', () async {
      final directory = await getApplicationDocumentsDirectory();
      SharedPreferences.setMockInitialValues({});
      final service = CaregiverService();
      await service.getAndSaveResources("uid");
      expect(service.vrResources.length, greaterThan(0));
      for (var resource in service.vrResources) {
        expect(
            File('${directory.path}/uid/vr${resource.id}/file_0').existsSync(),
            true);
      }
    });

    test('getAndSaveSampleResources', () async {
      final directory = await getApplicationDocumentsDirectory();
      SharedPreferences.setMockInitialValues({});
      final service = CaregiverService();
      await service.getAndSaveSampleResources();
      expect(service.vrSampleResources.length, greaterThan(0));
      for (var resource in service.vrSampleResources) {
        expect(
            File('${directory.path}/sample/vr${resource.id}/file_0')
                .existsSync(),
            true);
      }
    });

    test('getQueue', () async {
      SharedPreferences.setMockInitialValues({});
      final service = CaregiverService();
      await service.getQueue();
      expect(service.queue.length, greaterThan(0));
    });

    test('uploadSpace', () async {
      SharedPreferences.setMockInitialValues({});
      final service = CaregiverService();
      await service.uploadSpace(PostSpace(
          title: "title", location: "location", video: File("").path));
      expect(service.isPost, true);
    });

    test('uploadAvatar', () async {
      SharedPreferences.setMockInitialValues({});
      final service = CaregiverService();
      await service.uploadAvatar(PostAvatar(
          title: "title",
          gender: "gender",
          body: File("").path,
          face: File("").path));
      expect(service.isPost, true);
    });

    test('uploadSampleSpace', () async {
      SharedPreferences.setMockInitialValues({});
      final service = CaregiverService();
      await service.uploadSampleSpace(PostSampleSpace(
          title: "title", location: "location", video: File("").path));
      expect(service.isPost, true);
    });

    test('uploadSampleAvatar', () async {
      SharedPreferences.setMockInitialValues({});
      final service = CaregiverService();
      await service.uploadSampleAvatar(PostSampleAvatar(
          title: "title",
          gender: "gender",
          body: File("").path,
          face: File("").path));
      expect(service.isPost, true);
    });

    test('uploadVideo', () async {
      SharedPreferences.setMockInitialValues({});
      final service = CaregiverService();
      await service.uploadVideo(PostVrVideo(
        title: "title",
        sceneInfo: SceneInfo(
          resourceId: "resourceId",
          objectData: ObjectData(
            scale: Scale(x: 1, y: 1, z: 1),
            position: Scale(x: 1, y: 1, z: 1),
            rotation: Rotation(x: 1, y: 1, z: 1, w: 1),
          ),
        ),
        avatarsInfo: [
          AvatarsInfo(
            resourceId: "resourceId",
            objectData: ObjectData(
              scale: Scale(x: 1, y: 1, z: 1),
              position: Scale(x: 1, y: 1, z: 1),
              rotation: Rotation(x: 1, y: 1, z: 1, w: 1),
            ),
          ),
        ],
      ));
      expect(service.isPost, true);
    });

    test('uploadSampleVideo', () async {
      SharedPreferences.setMockInitialValues({});
      final service = CaregiverService();
      await service.uploadSampleVideo(PostVrVideo(
        title: "title",
        sceneInfo: SceneInfo(
          resourceId: "resourceId",
          objectData: ObjectData(
            scale: Scale(x: 1, y: 1, z: 1),
            position: Scale(x: 1, y: 1, z: 1),
            rotation: Rotation(x: 1, y: 1, z: 1, w: 1),
          ),
        ),
        avatarsInfo: [
          AvatarsInfo(
            resourceId: "resourceId",
            objectData: ObjectData(
              scale: Scale(x: 1, y: 1, z: 1),
              position: Scale(x: 1, y: 1, z: 1),
              rotation: Rotation(x: 1, y: 1, z: 1, w: 1),
            ),
          ),
        ],
      ));
      expect(service.isPost, true);
    });
  });
}
