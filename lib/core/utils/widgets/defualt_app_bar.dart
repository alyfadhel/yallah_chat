import 'package:flutter/material.dart';
import 'package:yallah_chat/core/resources/icon_broken.dart';
import 'package:yallah_chat/core/resources/values_manager.dart';

PreferredSizeWidget defaultAppBar({
  required  BuildContext context,
  String? title,
  List<Widget>?actions,
})=>AppBar(
  titleSpacing: AppSize.s5,
  leading: IconButton(
    onPressed: (){
      Navigator.pop(context);
    },
    icon: const Icon(
        IconBroken.Arrow___Left_2,
    ),
  ),
  title: Text(
    title!,
  ),
  actions: actions,

);