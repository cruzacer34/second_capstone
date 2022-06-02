import 'package:flutter/cupertino.dart';

class PoppinsText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;

  const PoppinsText({
    Key? key,
    required this.text,
    required this.size,
    required this.weight,
    this.color,
    this.textAlign,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontFamily: 'Poppins',
        fontSize: size,
        fontWeight: weight,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}