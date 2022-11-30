import 'package:flutter/material.dart';
import 'package:yallah_chat/core/resources/color_manager.dart';

class MyButton extends StatelessWidget {
  final double width;
  final Color background;
  final double radius;
  final Function() onPressedTextButton;
  final String text;
  final bool isUpperCase;
  final TextStyle? style;
  const MyButton({
    Key? key,
    this.width = double.infinity,
    this.background = ColorManager.bTwitter,
    this.radius = 20.0,
    required this.onPressedTextButton,
    required this.text,
    this.isUpperCase = true,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),

      ),
      child: TextButton(
        onPressed: onPressedTextButton,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: style,
        ),
      ),
    );
  }
}
