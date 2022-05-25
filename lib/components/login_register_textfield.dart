import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components.dart';

class LoginRegisterTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool isShown;
  final Function()? showPassword;
  final TextEditingController controller;

  const LoginRegisterTextField({
    Key? key,
    required this.hint,
    required this.icon,
    required this.isShown,
    this.showPassword,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      padding: const EdgeInsets.only(
        left: 12.77,
        top: 16,
        bottom: 17,
      ),
      prefix: prefixIcon(),
      keyboardType: (hint == 'Email Address')
          ? TextInputType.emailAddress
          : TextInputType.text,
      placeholder: hint,
      obscureText: (hint == 'Password' && !isShown) ? true : false,
      suffix: (hint == 'Password') ? suffixIcon() : null,
      placeholderStyle: placeholderStyle(),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }

  Widget prefixIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 22),
      child: Icon(
        icon,
        color: CustomColor.grey,
      ),
    );
  }

  TextStyle placeholderStyle() {
    return const TextStyle(
      color: Color(0xFF6A6A6A),
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
  }

  Widget suffixIcon() {
    return Padding(
      padding: const EdgeInsets.only(right: 20.63),
      child: Material(
        color: Colors.transparent,
        child: IconButton(
          onPressed: showPassword,
          icon: Icon(
            (!isShown) ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
            color: CustomColor.grey,
          ),
        ),
      ),
    );
  }
}
