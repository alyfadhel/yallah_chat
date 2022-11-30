import 'package:flutter/material.dart';
import 'package:yallah_chat/core/utils/widgets/defualt_app_bar.dart';

class NewPostScreen extends StatelessWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: 'Add Post',
      ),
    );
  }
}
