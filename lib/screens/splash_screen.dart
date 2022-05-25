import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_capstone/components/components.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Image.asset('assets/Logo.png'),
        backgroundColor: Colors.white,
        border: AppBarBorder.noElevation,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/main_bg.png'),
            text(),
            getStartedButton(context),
          ],
        ),
      ),
    );
  }

  Widget text() {
    return Column(
      children: const [
        TextWeight600(
          text: 'Find a Perfect\nJob Match',
          size: 34,
          color: Colors.black,
        ),
        SizedBox(height: 5),
        TextWeight400(
          text: 'Finding you dream job is more easier\n'
              'and faster with JobHub',
          size: 16,
          color: CustomColor.grey,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget getStartedButton(context) {
    return SizedBox(
      width: 261,
      height: 54,
      child: CupertinoButton(
        onPressed: () => Navigator.of(context).pushNamed('/loginScreen'),
        color: CupertinoTheme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Row(
          children: const [
            TextWeight400(
              text: 'Let\'s Get Started',
              size: 16,
              color: Colors.white,
            ),
            SizedBox(width: 8.33),
            Expanded(
              child: Icon(
                Icons.arrow_forward_sharp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
