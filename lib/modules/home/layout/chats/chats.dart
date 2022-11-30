import 'package:flutter/material.dart';
import 'package:yallah_chat/core/resources/color_manager.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Chats Screen',
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: ColorManager.sBlack,
        ),
      ),
    );
  }
}
