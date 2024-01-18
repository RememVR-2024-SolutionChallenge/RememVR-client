import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:remember_me/pages/caregiver/records/BelovedMainPage.dart';
import 'package:remember_me/pages/caregiver/home/HomeMainPage.dart';
import 'package:remember_me/pages/caregiver/settings/SettingMainPage.dart';
import 'package:remember_me/pages/caregiver/vr/VrMainPage.dart';

class NavigationPageWidget extends StatefulWidget {
  const NavigationPageWidget({super.key});
  @override
  _NavigationPageWidgetState createState() => _NavigationPageWidgetState();
}

class _NavigationPageWidgetState extends State<NavigationPageWidget> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 1);

  List<Widget> _widgetOptions() {
    return [
      HomeMainPageWidget(),
      VrMainPageWidget(),
      BelovedMainPageWidget(),
      SettingPageWidget()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        activeColorSecondary: Colors.white,
        activeColorPrimary: Color(0xff9292b7),
        icon: Image.asset("assets/images/home_icon.png"),
        title: "Home",
      ),
      PersistentBottomNavBarItem(
        activeColorSecondary: Colors.white,
        activeColorPrimary: Color(0xff9292b7),
        icon: Image.asset("assets/images/vr_icon.png"),
        title: "VR",
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: Color(0xff9292b7),
        activeColorSecondary: Colors.white,
        icon: Image.asset("assets/images/records_icon.png"),
        title: "Records",
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: Color(0xff9292b7),
        activeColorSecondary: Colors.white,
        icon: Image.asset("assets/images/settings_icon.png"),
        title: "Settings",
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(30.0),
          colorBehindNavBar: CupertinoColors.black,
        ),
        context,
        controller: _controller,
        screens: _widgetOptions(),
        items: _navBarItems(),
        backgroundColor: Color(0xff554A87),
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        navBarStyle: NavBarStyle.style7,
        navBarHeight: 65,
      ),
    );
  }
}
