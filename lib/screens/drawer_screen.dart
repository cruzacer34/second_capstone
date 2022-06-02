import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_capstone/components/components.dart';
import 'package:second_capstone/components/profile_pic.dart';
import 'package:second_capstone/providers/providers.dart';
import 'package:second_capstone/models/models.dart';

class DrawerScreen extends StatelessWidget {
  final Users user;

  const DrawerScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  void logout(context, UsersProvider usersProv) {
    usersProv.logout();
    Navigator.of(context).pushNamedAndRemoveUntil(
      '/loginScreen',
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final jobAppProv = Provider.of<JobApplicationsProvider>(context);
    final usersProv = Provider.of<UsersProvider>(context);

    Map<String, String> menu = {
      'assets/icons/icon-user.png': 'Edit Profile',
      'assets/icons/icon-history.png':
          'Applications (${jobAppProv.jobApps.length})',
      'assets/icons/icon-settings.png': 'Notification Settings',
      'assets/icons/icon-heart.png': 'Share App',
      'assets/icons/icon-logout.png': 'Logout',
    };

    List<Function()> functions = [
      () => Navigator.of(context).pushNamed(
            '/editProfileScreen',
            arguments: user,
          ),
      () => Navigator.of(context).pushNamed('/yourApplicationsScreen'),
      () => Navigator.of(context).pushNamed('/notificationScreen'),
      () {},
      () => logout(context, usersProv),
    ];

    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          top: kToolbarHeight,
          bottom: kBottomNavigationBarHeight,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProfilePic(width: 80),
                PoppinsText(
                  text: user.fullName,
                  size: 30,
                  weight: FontWeight.w500,
                  maxLines: 2,
                ),
                PoppinsText(
                  text: user.emailAddress,
                  size: 14,
                  weight: FontWeight.w400,
                  color: CustomColor.grey,
                ),
              ],
            ),
            ListView.separated(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: functions[index],
                  child: Row(
                    children: [
                      Image.asset(menu.keys.toList()[index]),
                      const SizedBox(width: 15),
                      PoppinsText(
                        text: menu.values.toList()[index],
                        size: 16,
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                height: (index == 3) ? 140 : 30,
              ),
              itemCount: menu.length,
            ),
          ],
        ),
      ),
    );
  }
}
