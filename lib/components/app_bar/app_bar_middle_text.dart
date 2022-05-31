import 'package:flutter/cupertino.dart';
import 'package:second_capstone/components/poppins_text.dart';

class AppBarMiddleText extends StatelessWidget {
  final String text;

  const AppBarMiddleText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PoppinsText(
      text: text,
      size: 20,
      weight: FontWeight.w500,
    );
  }
}
