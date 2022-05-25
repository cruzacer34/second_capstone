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
        topText(),
        const SizedBox(height: 30),
        socialMediaButtons(),
        const SizedBox(height: 40),
        bottomText(),
      ],
    );
  }

  Widget topText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        line(),
        const SizedBox(width: 10),
        const TextWeight400(
          text: 'Or Continue With',
          size: 16,
          color: CustomColor.grey,
        ),
        const SizedBox(width: 10),
        line(),
      ],
    );
  }

  Widget line() {
    return Container(
      height: 2,
      width: 20,
      color: const Color(0xFF9E9E9E),
    );
  }

  Widget socialMediaButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: Image.asset('assets/logos/Google.png'),
        ),
        const SizedBox(width: 20),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: Image.asset('assets/logos/Facebook.png'),
        ),
      ],
    );
  }

  Widget bottomText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (isWelcomeScreen)
            ? const TextWeight600(
                text: 'New User? ',
                size: 16,
                color: CustomColor.grey,
              )
            : const TextWeight400(
                text: 'Already Have an Account? ',
                size: 16,
                color: CustomColor.grey,
              ),
        TextButton(
          style: NoButtonPadding.textButton,
          onPressed: createOrLogIn,
          child: TextWeight500(
            text: (isWelcomeScreen) ? 'Create Account' : 'Log In',
            size: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
