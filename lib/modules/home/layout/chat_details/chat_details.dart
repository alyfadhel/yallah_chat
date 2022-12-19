import 'package:flutter/material.dart';
import 'package:yallah_chat/core/resources/color_manager.dart';
import 'package:yallah_chat/core/resources/icon_broken.dart';
import 'package:yallah_chat/core/resources/values_manager.dart';
import 'package:yallah_chat/model/user_model.dart';

class ChatDetailsScreen extends StatelessWidget {
  final UserModel userModel;
  const ChatDetailsScreen({Key? key,required this.userModel}) : super(key: key);

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
        titleSpacing: 0.0,
        centerTitle: false,
        title: Row(
          children: [
            CircleAvatar(
              radius: AppSize.s25,
              backgroundImage: NetworkImage(
                userModel.image,
              ),
            ),
            const SizedBox(
              width: AppSize.s20,
            ),
            Text(
              userModel.name
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSize.s5,
                  horizontal: AppSize.s10,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(10.0,),
                    topEnd: Radius.circular(10.0,),
                    topStart: Radius.circular(10.0,),
                  ),
                  color: Colors.blue[300]
                ),
                child: Wrap(
                  children: const [
                    Text(
                      'Hello World',
                    ),
                  ],
                )
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSize.s5,
                    horizontal: AppSize.s10,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(10.0,),
                        topEnd: Radius.circular(10.0,),
                        topStart: Radius.circular(10.0,),
                      ),
                      color: Colors.green[300]
                  ),
                  child: Wrap(
                    children: const [
                      Text(
                        'Hello World',
                      ),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
