import 'package:flutter/cupertino.dart';
import 'package:second_capstone/components/app_bar/app_bar_middle_text.dart';
import 'package:second_capstone/components/app_bar/custom_cupertino_nav_bar.dart';
import 'package:second_capstone/components/black_icon_button.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CustomCupertinoNavBar(
        middle: const AppBarMiddleText(text: 'Message'),
        trailing: BlackIconButton(
          icon: CupertinoIcons.search,
          onPressed: () {},
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: const [
              Text('Message Screen')
            ],
          ),
        ),
      ),
    );
  }
}
