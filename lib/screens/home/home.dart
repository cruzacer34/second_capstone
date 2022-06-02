import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:second_capstone/screens/drawer_screen.dart';
import 'package:second_capstone/screens/edit_profile_screen.dart';
import 'package:second_capstone/screens/home/home_screen.dart';
import 'package:second_capstone/screens/messages/messages_screen.dart';
import 'package:second_capstone/screens/notification_screen.dart';
import '../../models/users.dart';

class Home extends StatelessWidget {
  final Users user;
  final _drawerController = ZoomDrawerController();

  Home({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: ZoomDrawer(
        controller: _drawerController,
        borderRadius: 30.0,
        showShadow: true,
        angle: 0.0,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 20,
            spreadRadius: -10,
          ),
        ],
        shadowLayer1Color: Colors.transparent,
        shadowLayer2Color: Colors.grey.withOpacity(0.03),
        slideWidth: MediaQuery.of(context).size.width * 0.8,
        mainScreenScale: 0.1,
        menuScreenWidth: MediaQuery.of(context).size.width * 0.9,
        menuScreen: DrawerScreen(user: user),
        mainScreen: CupertinoPageScaffold(
          resizeToAvoidBottomInset: false,
          child: PersistentTabView(
            context,
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(30),
              colorBehindNavBar: CupertinoColors.white,
            ),
            navBarStyle: NavBarStyle.style12,
            screens: [
              HomeScreen(
                user: user,
                onToggleDrawer: () => _drawerController.toggle?.call(),
              ),
              const MessagesScreen(),
              EditProfileScreen(user: user),
              const NotificationScreen(),
            ],
            items: [
              PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.house_fill),
                title: 'Home',
                activeColorPrimary: CupertinoTheme.of(context).primaryColor,
                inactiveColorPrimary: CupertinoColors.systemGrey,
              ),
              PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.ellipses_bubble_fill),
                title: 'Messages',
                activeColorPrimary: CupertinoTheme.of(context).primaryColor,
                inactiveColorPrimary: CupertinoColors.systemGrey,
              ),
              PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.person_alt),
                title: 'Profile',
                inactiveColorPrimary: CupertinoColors.systemGrey,
                onPressed: (x) => pushNewScreenWithRouteSettings(
                  context,
                  settings: const RouteSettings(name: '/editProfileScreen'),
                  screen: EditProfileScreen(user: user),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                ),
              ),
              PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.gear_alt_fill),
                title: 'Settings',
                inactiveColorPrimary: CupertinoColors.systemGrey,
                onPressed: (x) => pushNewScreenWithRouteSettings(
                  context,
                  settings: const RouteSettings(name: '/notificationScreen'),
                  screen: const NotificationScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
