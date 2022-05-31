import 'package:flutter/material.dart';

class CustomColor {
  static const Color grey = Color(0xFF6A6A6A);
}

class Draw {
  static Container greyLine = Container(
    height: 2,
    width: 20,
    color: const Color(0xFF9E9E9E),
  );
  static Container blackLine = Container(
    height: 2,
    width: 15,
    color: Colors.black,
  );
  static Transform bulletPoint = Transform.translate(
    offset: const Offset(0, -8),
    child: const Text(
      '• ',
      style: TextStyle(fontSize: 30),
    ),
  );
}

class CustomBorder {
  static BorderRadius radius12 = const BorderRadius.all(Radius.circular(12));
  static Border noElevation = const Border(
    bottom: BorderSide(
      color: Colors.transparent,
    ),
  );
  static BoxDecoration whiteBoxRadius12 = BoxDecoration(
    borderRadius: radius12,
    color: Colors.white,
  );
  static BoxDecoration whiteBoxRadius15 = const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(15)),
    color: Colors.white,
  );
  static BoxDecoration greyBoxRadius12 = BoxDecoration(
    borderRadius: radius12,
    color: const Color(0xFFFAFAFA),
  );
  static BoxDecoration transparentBoxRadius12 = BoxDecoration(
    borderRadius: radius12,
  );
  static RoundedRectangleBorder cardRadius12 = RoundedRectangleBorder(
    borderRadius: radius12,
  );
  static RoundedRectangleBorder cardRadius20 = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)));
  static BoxDecoration customModal = const BoxDecoration(
    color: Color(0xFFFCFCFC),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(50),
      topRight: Radius.circular(50),
    ),
  );
}

class CustomPadding {
  static EdgeInsets loginRegisterPadding = const EdgeInsets.only(
    left: 20,
    right: 20,
    top: kToolbarHeight * 2,
  );
  static ButtonStyle noPaddingTextButton = TextButton.styleFrom(
    padding: EdgeInsets.zero,
    minimumSize: Size.zero,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}
