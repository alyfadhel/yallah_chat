import 'package:flutter/material.dart';
import 'package:yallah_chat/core/resources/icon_broken.dart';

class ChatDetailsScreen extends StatelessWidget {
  const ChatDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: ()
            {
              Navigator.pop(context);
            },
            icon: const Icon(
              IconBroken.Arrow___Left_2
            ),),
      ),
      body: Center(
        child: Text(
          'Chat Details Screen',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
