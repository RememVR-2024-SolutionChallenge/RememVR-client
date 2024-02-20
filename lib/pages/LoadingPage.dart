import 'package:flutter/material.dart';
import 'package:remember_me/pages/auth/FinishRegisterationPage.dart';
import 'dart:async';

import 'package:remember_me/pages/auth/SelectUserTypePage.dart';
import 'package:remember_me/pages/caregiver/vr/VrCompletionPage.dart';

class LoadingPageWidget extends StatefulWidget {
  const LoadingPageWidget({super.key, required this.isVideo});
  final bool isVideo;

  @override
  _LoadingPageWidgetState createState() => _LoadingPageWidgetState();
}

class _LoadingPageWidgetState extends State<LoadingPageWidget>
    with TickerProviderStateMixin {
  int _currentLogoIndex = 0;
  List<String> _logoImages = [
    'assets/images/logo1.png',
    'assets/images/logo2.png',
    'assets/images/logo3.png',
  ];
  late Timer _timer;
  late AnimationController _animationController1;
  late AnimationController _animationController2;

  @override
  void initState() {
    super.initState();
    _animationController1 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animationController2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _startTimer();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => widget.isVideo
                ? VrCompletionPageWidget()
                : FinishRegisterationPageWidget()),
      );
    });
  }

  void _startTimer() {
    const duration = Duration(seconds: 1);
    _timer = Timer.periodic(duration, (timer) {
      setState(() {
        _currentLogoIndex = (_currentLogoIndex + 1) % _logoImages.length;
        _animationController1.reset();
        _animationController2.reset();
        _animationController1.forward();
        _animationController2.forward();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _animationController1.dispose();
    _animationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Stack(
                children: [
                  RotationTransition(
                    turns: Tween<double>(begin: 0.0, end: 1.0)
                        .animate(_animationController2),
                    child: FadeTransition(
                      opacity: Tween<double>(begin: 1.0, end: 0.0)
                          .animate(_animationController1),
                      child: Image.asset(_logoImages[_currentLogoIndex]),
                    ),
                  ),
                  RotationTransition(
                    turns: _animationController2
                        .drive(CurveTween(curve: Curves.easeInOut)),
                    child: FadeTransition(
                      opacity: _animationController1
                          .drive(CurveTween(curve: Curves.easeInOut)),
                      child: Image.asset(_logoImages[
                          (_currentLogoIndex + 1) % _logoImages.length]),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Loading...',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFDCDCE8),
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
