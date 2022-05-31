import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:second_capstone/components/app_bar/app_bar_middle_text.dart';
import 'package:second_capstone/components/components.dart';
import 'package:second_capstone/providers/providers.dart';

import '../components/app_bar/custom_cupertino_nav_bar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool state = false;
  final Map<String, String> settings = {
    'New Post': 'If any new post update',
    'Got Hired': 'If you get hired any company',
    'Get Rejected': 'If you rejected by any company',
    'Message': 'Got any new message',
    'Call': 'Have a call',
    'Dark Mode': 'Enable dark theme',
  };
  List<bool> cupertinoSwitch = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    final usersProv = Provider.of<UsersProvider>(context);
    return CupertinoPageScaffold(
      navigationBar: const CustomCupertinoNavBar(
        middle: AppBarMiddleText(text: 'Notifications'),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PoppinsText(
                    text: settings.keys.toList()[index],
                    size: 20,
                    weight: FontWeight.w500,
                  ),
                  PoppinsText(
                    text: settings.values.toList()[index],
                    size: 12,
                    weight: FontWeight.w400,
                    color: CustomColor.grey,
                  ),
                ],
              ),
              Transform.scale(
                alignment: Alignment.centerRight,
                scale: 0.8,
                child: CupertinoSwitch(
                  activeColor: CupertinoTheme.of(context).primaryColor,
                  value: usersProv.selectedUser()!.notifications[index],
                  onChanged: (value) => setState(() {
                    usersProv.selectedUser()!.notifications[index] = value;
                  }),
                ),
              ),
            ],
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 30),
          itemCount: settings.length,
        ),
      ),
    );
  }
}
