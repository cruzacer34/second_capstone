import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;
  final double? left;
  final double? right;
  final Color? color;
  final double? size;

  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.left,
    this.right,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: left ?? 0,
        right: right ?? 0,
      ),
      child: Material(
        color: Colors.transparent,
        child: IconButton(
          icon: Icon(
            icon,
            color: color ?? Colors.black,
            size: size,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
