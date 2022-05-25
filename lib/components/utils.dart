import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWeight400 extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final TextAlign? textAlign;

  const TextWeight400({
    Key? key,
    required this.text,
    required this.size,
    required this.color,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontFamily: 'Poppins',
        fontSize: size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class TextWeight500 extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const TextWeight500({
    Key? key,
    required this.text,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: 'Poppins',
        fontSize: size,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class TextWeight600 extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const TextWeight600({
    Key? key,
    required this.text,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: 'Poppins',
        fontSize: size,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class TextWeight700 extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const TextWeight700({
    Key? key,
    required this.text,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: 'Poppins',
        fontSize: size,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class NoButtonPadding {
  static ButtonStyle textButton = TextButton.styleFrom(
    padding: EdgeInsets.zero,
    minimumSize: Size.zero,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}

class CustomColor {
  static const Color grey = Color(0xFF6A6A6A);
}

class AppBarBorder {
  static Border noElevation = const Border(
    bottom: BorderSide(
      color: Colors.transparent,
    ),
  );
}