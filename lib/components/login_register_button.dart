import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_capstone/components/components.dart';

class LoginRegisterButton extends StatelessWidget {
  final bool isWelcomeScreen;
  final Function() onPressed;

  const LoginRegisterButton({
    Key? key,
    required this.isWelcomeScreen,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 54,
      child: CupertinoButton(
        onPressed: onPressed,
        color: CupertinoTheme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: TextWeight500(
          text: (isWelcomeScreen) ? 'LOG IN' : 'SIGN UP',
          size: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
