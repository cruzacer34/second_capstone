import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_capstone/components/components.dart';
import 'package:second_capstone/components/custom_cupertino_buttons.dart';
import '../components/app_bar/custom_cupertino_nav_bar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      navigationBar: CustomCupertinoNavBar(
        leading: Image.asset('assets/Logo.png'),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/main_bg.png',
                width: 275,
              ),
              Column(
                children: const [
                  PoppinsText(
                    text: 'Find a Perfect\nJob Match',
                    size: 34,
                    weight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  ),
                  PoppinsText(
                    text: 'Finding you dream job is more easier\n'
                        'and faster with JobHub',
                    size: 16,
                    color: CustomColor.grey,
                    textAlign: TextAlign.center,
                    weight: FontWeight.w400,
                  ),
                ],
              ),
              CustomCupertinoButtons(
                width: 265,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    PoppinsText(
                      text: 'Let\'s Get Started',
                      size: 16,
                      weight: FontWeight.w400,
                    ),
                    Icon(
                      Icons.arrow_forward_sharp,
                      color: Colors.white,
                    ),
                  ],
                ),
                onPressed: () =>
                    Navigator.of(context).pushNamed('/loginScreen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
