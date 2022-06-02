import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_capstone/components/components.dart';
import 'package:second_capstone/providers/providers.dart';
import '../../components/custom_icon_button.dart';
import '../../models/users.dart';

class CallScreen extends StatelessWidget {
  final Users friend;

  const CallScreen({
    Key? key,
    required this.friend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersProv = Provider.of<UsersProvider>(context);
    return CupertinoPageScaffold(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(friend.portraitPicUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomIconButton(
                    icon: CupertinoIcons.back,
                    onPressed: () => Navigator.of(context).pop(),
                    color: Colors.white,
                    size: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            usersProv.selectedUser().portraitPicUrl,
                            height: 150,
                          ),
                        ),
                        Positioned(
                          bottom: -20,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: CupertinoColors.systemPink,
                              shape: BoxShape.circle,
                              border: Border.all(width: 1),
                            ),
                            child: CustomIconButton(
                              icon: CupertinoIcons.camera_rotate,
                              onPressed: () {},
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Spacer(),
              PoppinsText(
                text: friend.fullName,
                size: 16,
                weight: FontWeight.w500,
                color: CupertinoColors.white,
              ),
              const PoppinsText(
                text: '01:17',
                size: 13,
                weight: FontWeight.w500,
                color: CupertinoColors.white,
              ),
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                    ),
                    child: CustomIconButton(
                      icon: CupertinoIcons.mic,
                      onPressed: () {},
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: CustomIconButton(
                      icon: CupertinoIcons.phone_down,
                      onPressed: () => Navigator.of(context).pop(),
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                    ),
                    child: CustomIconButton(
                      icon: CupertinoIcons.video_camera,
                      onPressed: () => Navigator.of(context).pop(),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: kBottomNavigationBarHeight),
            ],
          ),
        ),
      ),
    );
  }
}
