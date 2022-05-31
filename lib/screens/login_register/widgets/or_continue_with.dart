import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_capstone/components/components.dart';

class OrContinueWith extends StatelessWidget {
  final bool isWelcomeScreen;
  final Function() createOrLogIn;

  const OrContinueWith({
    Key? key,
    required this.isWelcomeScreen,
    required this.createOrLogIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Draw.greyLine,
            const SizedBox(width: 10),
            const PoppinsText(
              text: 'Or Continue With',
              size: 16,
              weight: FontWeight.w400,
              color: CustomColor.grey,
            ),
            const SizedBox(width: 10),
            Draw.greyLine,
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            socialMediaButton('assets/logos/Google.png'),
            const SizedBox(width: 20),
            socialMediaButton('assets/logos/Facebook.png'),
          ],
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PoppinsText(
              text: (isWelcomeScreen)
                  ? 'New User? '
                  : 'Already Have an Account? ',
              size: 16,
              weight: (isWelcomeScreen) ? FontWeight.w600 : FontWeight.w400,
              color: CustomColor.grey,
            ),
            TextButton(
              style: CustomPadding.noPaddingTextButton,
              onPressed: createOrLogIn,
              child: PoppinsText(
                text: (isWelcomeScreen) ? 'Create Account' : 'Log In',
                size: 16,
                weight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget socialMediaButton(String imageUrl) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      child: Image.asset(imageUrl),
    );
  }
}
