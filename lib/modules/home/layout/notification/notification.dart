import 'package:flutter/material.dart';
import 'package:yallah_chat/core/resources/color_manager.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Notification Screen',
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: ColorManager.sBlack,
        ),
      ),
    );
  }
}
