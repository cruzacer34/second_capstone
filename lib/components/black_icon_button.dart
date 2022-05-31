import 'package:flutter/material.dart';

class BlackIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;

  const BlackIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(
          minHeight: 0,
          minWidth: 0,
        ),
        icon: Icon(
          icon,
          color: Colors.black,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
