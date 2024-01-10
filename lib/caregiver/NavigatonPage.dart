import 'package:flutter/material.dart';
import 'package:remember_me/caregiver/beloved/BelovedMainPage.dart';
import 'package:remember_me/caregiver/home/HomeMainPage.dart';
import 'package:remember_me/caregiver/mypage/MyMainPage.dart';
import 'package:remember_me/caregiver/vr/VrMainPage.dart';

class NavigationPageWidget extends StatefulWidget {
  const NavigationPageWidget({super.key});
  @override
  _NavigationPageWidgetState createState() => _NavigationPageWidgetState();
}

class _NavigationPageWidgetState extends State<NavigationPageWidget> {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      HomeMainPageWidget(),
      VrMainPageWidget(),
      BelovedMainPageWidget(),
      MyMainPageWidget()
    ];
    return Scaffold(
        body: SafeArea(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 44),
                activeIcon: Icon(Icons.home_filled, size: 44),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.video_call, size: 44),
                activeIcon: Icon(Icons.video_call_outlined, size: 44),
                label: "VR",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.image, size: 44),
                activeIcon: Icon(Icons.image_outlined, size: 44),
                label: "beloved",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.info, size: 44),
                activeIcon: Icon(Icons.info_outline, size: 44),
                label: "Mypage",
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            unselectedItemColor: const Color(0xff757575),
            onTap: _onItemTapped,
            selectedLabelStyle: TextStyle(fontFamily: "SUITE"),
          ),
        ));
  }
}
