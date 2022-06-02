import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_capstone/components/custom_icon_button.dart';
import 'package:second_capstone/components/utils.dart';

class CustomCupertinoNavBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  final Widget? leading;
  final Widget? middle;
  final Widget? trailing;

  const CustomCupertinoNavBar({
    Key? key,
    this.leading,
    this.middle,
    this.trailing,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  bool shouldFullyObstruct(BuildContext context) => false;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
      border: CustomBorder.noElevation,
      leading: (leading == null)
          ? CustomIconButton(
              icon: CupertinoIcons.back,
              onPressed: () => Navigator.of(context).pop(),
            )
          : leading,
      middle: middle,
      trailing: trailing,
    );
  }
}
