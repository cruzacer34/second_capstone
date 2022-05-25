import 'package:flutter/material.dart';
import 'package:second_capstone/components/components.dart';

class LoginRegisterTitle extends StatelessWidget {
  final String title;

  const LoginRegisterTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (title == 'Welcome Back!')
            ? TextWeight700(
                text: title,
                size: 30,
                color: Colors.black,
              )
            : TextWeight600(
                text: title,
                size: 30,
                color: Colors.black,
              ),
        const SizedBox(height: 10),
        const TextWeight400(
          text: 'Fill your details or continue\n'
              'with social media',
          size: 16,
          color: CustomColor.grey,
        ),
      ],
    );
  }
}
