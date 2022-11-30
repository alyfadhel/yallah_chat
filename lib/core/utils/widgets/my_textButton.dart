import 'package:flutter/material.dart';
import 'package:yallah_chat/core/resources/color_manager.dart';

class MyTextButton extends StatelessWidget {

  final  Function() onPressedTextButton;
  final String text;
  final bool isUpperCase;

  const MyTextButton({
    Key? key,
    required this.onPressedTextButton,
    required this.text,
    this.isUpperCase = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressedTextButton,
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: ColorManager.bTwitter,
        ),
      ),
    );
  }
}
