import 'package:flutter/cupertino.dart';
import 'package:second_capstone/components/utils.dart';

class CustomCupertinoButtons extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  final double? width;


  const CustomCupertinoButtons({
    Key? key,
    required this.child,
    required this.onPressed,
    this.width,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 54,
      child: CupertinoButton(
        onPressed: onPressed,
        color: CupertinoTheme.of(context).primaryColor,
        borderRadius: CustomBorder.radius12,
        padding: EdgeInsets.zero,
        child: child,
      ),
    );
  }
}