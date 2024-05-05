import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<void> printAllFilesInSubfolders(String directoryPath) async {
  // 디렉토리 객체 생성
  final directory = Directory(directoryPath);

  // 해당 디렉토리가 존재하는지 확인
  if (await directory.exists()) {
    // 모든 하위 폴더를 재귀적으로 탐색하여 파일을 출력하는 함수 호출
    _printFilesRecursively(directory);
  } else {
    print("Directory does not exist: $directoryPath");
  }
}

void _printFilesRecursively(Directory directory) {
  // 현재 디렉토리의 모든 항목을 가져오기
  final entities = directory.listSync();

  for (var entity in entities) {
    if (entity is Directory) {
      // 하위 디렉토리가 있다면 재귀적으로 함수 호출

      _printFilesRecursively(entity);
    } else if (entity is File) {
      // 파일이면 경로 출력
      print(entity.path);
    }
  }
}

Future<void> readAllMetaDataFiles() async {
  try {
    // 앱의 문서 디렉토리를 가져옵니다.
    final Directory appDir = await getApplicationDocumentsDirectory();
    final String sampleDirPath = '${appDir.path}/sample';
    final Directory sampleDir = Directory(sampleDirPath);

    // sample 디렉토리의 모든 하위 폴더를 가져옵니다.
    final List<FileSystemEntity> folders = sampleDir.listSync().where((entity) {
      return FileSystemEntity.isDirectorySync(entity.path);
    }).toList();

    // 각 하위 폴더의 meta-data.json 파일을 읽습니다.
    for (FileSystemEntity folder in folders) {
      final String metaDataFilePath = '${folder.path}/meta-data.json';
      final File metaDataFile = File(metaDataFilePath);

      if (await metaDataFile.exists()) {
        final String jsonString = await metaDataFile.readAsString();
        final Map<String, dynamic> jsonData = jsonDecode(jsonString);

        // JSON 데이터 처리 또는 출력
        print('메타 데이터 (${folder.path}): $jsonData');
      } else {
        print('파일을 찾을 수 없습니다: $metaDataFilePath');
      }
    }
  } catch (e) {
    print('오류 발생: $e');
  }
}

Future<void> readMetaData() async {
  try {
    // 앱의 문서 디렉토리를 가져옵니다.
    final Directory appDir = await getApplicationDocumentsDirectory();

    // `meta-data.json` 파일로의 전체 경로를 작성합니다.
    final String filePath =
        '${appDir.path}/sample/2bb7e001f1871e3ee22e705cd8223b3124ce7829275b42e6cdeb3260be961c95/meta-data.json';

    // 파일 내용을 문자열로 읽어옵니다.
    final File file = File(filePath);
    if (await file.exists()) {
      final String jsonString = await file.readAsString();

      // JSON 문자열을 파싱합니다.
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);

      // 콘솔에 출력하거나 필요한 대로 처리합니다.
      print(jsonData);
    } else {
      print("파일을 찾을 수 없습니다: $filePath");
    }
  } catch (e) {
    print('파일 읽기 오류: $e');
  }
}
