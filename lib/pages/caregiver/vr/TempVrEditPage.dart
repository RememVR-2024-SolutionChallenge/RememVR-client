import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remember_me/model/VrModel.dart';
import 'package:remember_me/pages/caregiver/vr/VrAlertPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrQueuePage.dart';
import 'package:remember_me/services/CarerecipientService.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TempVrEditPageWidget extends StatefulWidget {
  const TempVrEditPageWidget({super.key});
  @override
  _TempVrEditPageWidgetState createState() => _TempVrEditPageWidgetState();
}

class _TempVrEditPageWidgetState extends State<TempVrEditPageWidget> {
  late WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://rememvr-2024-solutionchallenge.github.io/vr-viewer-test/editor.html?scene=scene_1&avatar=avatar_1'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: WebViewWidget(controller: controller),
    ));
  }
}
