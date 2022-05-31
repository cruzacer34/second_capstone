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
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PoppinsText(
              text: title,
              size: 30,
              weight:
                  (title == 'Welcome Back!') ? FontWeight.w700 : FontWeight.w600,
            ),
            const SizedBox(height: 10),
            const PoppinsText(
              text: 'Fill your details or continue\n'
                  'with social media',
              size: 16,
              weight: FontWeight.w400,
              color: CustomColor.grey,
            ),
          ],
        ),
      ),
    );
  }
}
