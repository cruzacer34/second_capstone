import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_capstone/components/components.dart';
import 'package:second_capstone/components/text_field_header.dart';

class ApplicationDetailsFields extends StatelessWidget {
  final String header;
  final Widget child;
  final double? width;
  final double? height;

  const ApplicationDetailsFields({
    Key? key,
    required this.header,
    required this.child,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldHeader(text: header),
        const SizedBox(height: 10),
        Container(
          height: height ?? 52,
          width: width,
          decoration: CustomBorder.whiteBoxRadius12,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
