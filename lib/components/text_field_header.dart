import 'package:flutter/cupertino.dart';
import 'package:second_capstone/components/poppins_text.dart';
import 'package:second_capstone/components/utils.dart';

class TextFieldHeader extends StatelessWidget {
  final String text;

  const TextFieldHeader({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PoppinsText(
      text: text,
      size: 16,
      weight: FontWeight.w400,
      color: CustomColor.grey,
    );
  }
}
