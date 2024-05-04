import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:remember_me/model/VrModel.dart';
import 'package:remember_me/pages/carerecipient/vr/VrExperiencePage.dart';
import 'package:remember_me/pages/carerecipient/vr/VrSelectPage.dart';
import 'package:remember_me/services/CarerecipientService.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:test/test.dart' as tests;

class MockCarerecipientService extends CarerecipientService {
  @override
  Future<void> getAllVrVideos() async {}

  @override
  Future<void> getCaregiverGroup() async {}

  @override
  Future<void> getUserInfo() async {}

  @override
  Future<void> getSampleVrVideos() async {}
}

void main() {
  group('VrSelectPageWidget', () {
    testWidgets('renders VrSelectPage', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ChangeNotifierProvider<CarerecipientService>(
          create: (_) => MockCarerecipientService(),
          child: VrSelectPageWidget(),
        ),
      ));
      expect(find.text('VR Experiences'), findsOneWidget);
      expect(find.byType(VrCard), findsNothing);
    });

    testWidgets('renders VrCard', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ChangeNotifierProvider<CarerecipientService>(
          create: (_) => MockCarerecipientService(),
          child: VrSelectPageWidget(),
        ),
      ));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(VrCard));
      await tester.pumpAndSettle();
      expect(find.text('Notification'), findsOneWidget);
      expect(find.text('OK'), findsOneWidget);
    });
  });

  group('VrCard', () {
    testWidgets('renders VrCard', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ChangeNotifierProvider<CarerecipientService>(
          create: (_) => MockCarerecipientService(),
          child: VrCard(
            uid: 'uid',
            id: 'id',
            video: GetVrVideo(
              title: 'title',
              avatars: [
                VrResources(
                  id: 'id',
                  title: 'title',
                  storageUrls: ['url'],
                )
              ],
              scene: VrResources(
                id: 'id',
                title: 'title',
                storageUrls: ['url'],
              ),
            ),
          ),
        ),
      ));
      expect(find.text('Avatar :'), findsOneWidget);
      expect(find.text('Space :'), findsOneWidget);
    });
  });

  group('downloadAndSave', () {
    test('downloads and saves a file', () async {
      final directory = await getApplicationDocumentsDirectory();
      final resource = VrResources(
        id: 'id',
        title: 'title',
        storageUrls: ['url'],
      );
      await downloadAndSave(resource, directory.path);
      final file = File(path.join(directory.path, 'id', 'url.jpg'));
      expect(await file.exists(), true);
    });
  });
  group('downloadMissingResources', () {
    test('downloads missing resources', () async {
      final directory = await getApplicationDocumentsDirectory();
      final vrVideo = GetVrVideo(
        title: 'title',
        avatars: [
          VrResources(
            id: 'id',
            title: 'title',
            storageUrls: ['url'],
          )
        ],
        scene: VrResources(
          id: 'id',
          title: 'title',
          storageUrls: ['url'],
        ),
      );
      await downloadMissingResources(vrVideo, directory.path);
      final sceneDirectory =
          Directory(path.join(directory.path, vrVideo.scene!.id));
      final avatarDirectory =
          Directory(path.join(directory.path, vrVideo.avatars![0].id));
      expect(await sceneDirectory.exists(), true);
      expect(await avatarDirectory.exists(), true);
    });
  });
}

Future<void> downloadAndSave(VrResources resource, String baseDirectory) async {
  final resourceDirectory = Directory(path.join(baseDirectory, resource.id));

  if (!await resourceDirectory.exists()) {
    await resourceDirectory.create(recursive: true);
  }

  if (resource.storageUrls != null) {
    for (var url in resource.storageUrls!.where((url) => url != null)) {
      final response = await http.get(Uri.parse(url!));
      if (response.statusCode == 200) {
        File file = File(path.join(
            resourceDirectory.path, path.basename(url).substring(0, 9)));
        await file.writeAsBytes(response.bodyBytes);
      } else {
        print('Failed to download file from $url');
      }
    }
  }
}

Future<void> downloadMissingResources(
    GetVrVideo vrVideo, String baseDirectory) async {
  Directory baseDir = Directory(baseDirectory);

  if (!await baseDir.exists()) {
    await baseDir.create(recursive: true);
  }

  if (vrVideo.scene != null &&
      !await Directory(path.join(baseDirectory, vrVideo.scene!.id)).exists()) {
    await downloadAndSave(vrVideo.scene!, baseDirectory);
  }

  if (vrVideo.avatars != null) {
    for (var avatar in vrVideo.avatars!) {
      if (avatar != null &&
          !await Directory(path.join(baseDirectory, avatar.id)).exists()) {
        await downloadAndSave(avatar, baseDirectory);
      }
    }
  }
}
