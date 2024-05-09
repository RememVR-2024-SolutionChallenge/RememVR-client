import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class VrTestWebViewPage extends StatefulWidget {
  const VrTestWebViewPage({super.key, required this.video_id});
  final String video_id;
  @override
  _VrTestWebViewPageState createState() => _VrTestWebViewPageState();
}

class _VrTestWebViewPageState extends State<VrTestWebViewPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    print(widget.video_id);

    // 플랫폼 별 컨트롤러 생성
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    // JavaScript 모드 및 탐색 옵션 설정
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress: $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('Blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('Allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {
            debugPrint('URL change to ${change.url}');
          },
        ),
      )
      ..addJavaScriptChannel(
        'FileRequest',
        onMessageReceived: (JavaScriptMessage message) async {
          String jsonString = message.message;
          Map<String, dynamic> msgs = jsonDecode(jsonString);
          print("==========================");
          print(jsonString);
          String filePath = msgs['filePath'];
          String type = msgs['type'];
          print(filePath); //filePath 바뀌기 전
          print(type);
          filePath = await getPath(filePath);
          print(filePath); //filePath 바뀐 후
          File requestedFile = File(filePath);
          if (await requestedFile.exists()) {
            try {
              String fileContent = await requestedFile.readAsString();
              // 데이터를 Base64로 인코딩하고 URI로 인코딩
              String base64Encoded = base64Encode(utf8.encode(fileContent));
              String uriEncoded = Uri.encodeComponent(base64Encoded);
              // JavaScript에 데이터 전송
              _controller.runJavaScript('onFileReceived($uriEncoded,$type)');
            } catch (e) {
              print("Error sending file content: $e");
            }
          } else {
            print("File does not exist.");
          }
        },
      )
      ..loadRequest(Uri.parse(
          'https://rememvr-2024-solutionchallenge.github.io/vr-viewer/vrviewer?video-id=${widget.video_id}'));

    // 플랫폼에 따른 세부 설정 (Android와 WebKit)
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }

    _controller = controller;
  }

  Future<String> getPath(String partialPath) async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/$partialPath';
  }

  Future<File> _retrieveFile(String path) async {
    // 지정된 경로에 따라 파일을 찾음 (앱의 디렉터리 기준)
    final Directory directory = await getApplicationDocumentsDirectory();
    final String fullPath = '${directory.path}/$path';
    return File(fullPath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView with File Access'),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
