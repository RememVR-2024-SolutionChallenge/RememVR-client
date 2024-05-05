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
