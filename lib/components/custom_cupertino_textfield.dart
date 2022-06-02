import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_capstone/components/components.dart';
import 'package:second_capstone/components/custom_icon_button.dart';

class CustomCupertinoTextField extends StatelessWidget {
  final String? hint;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool? isShown;
  final Function()? onSuffixPressed;
  final TextEditingController controller;
  final TextAlign? textAlign;
  final int? multiLine;

  const CustomCupertinoTextField({
    Key? key,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.isShown,
    this.onSuffixPressed,
    required this.controller,
    this.textAlign,
    this.multiLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      padding: EdgeInsets.only(
        left: (prefixIcon != null) ? 15 : 0,
        top: 18,
        bottom: 18,
      ),
      prefixMode: (textAlign != null)
          ? OverlayVisibilityMode.never
          : OverlayVisibilityMode.always,
      prefix: Padding(
        padding: EdgeInsets.only(
          left: (prefixIcon != null) ? 20 : 0,
        ),
        child: Icon(
          prefixIcon,
          color: CustomColor.grey,
        ),
      ),
      placeholder: hint,
      style: const TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      textAlign: textAlign ?? TextAlign.start,
      textAlignVertical: TextAlignVertical.top,
      maxLines: multiLine ?? 1,
      obscureText: (isShown == false) ? true : false,
      suffix: (hint == 'Password')
          ? CustomIconButton(
              right: 20,
              icon: isShown == true ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
              onPressed: onSuffixPressed,
              color: CustomColor.grey,
            )
          : suffixIcon,
      placeholderStyle: const TextStyle(
        color: CustomColor.grey,
        fontFamily: 'Poppins',
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      decoration: CustomBorder.whiteBoxRadius12,
    );
  }
}
