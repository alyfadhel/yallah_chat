import 'package:flutter/material.dart';
import 'package:yallah_chat/core/resources/color_manager.dart';
import 'package:yallah_chat/core/resources/icon_broken.dart';
import 'package:yallah_chat/core/resources/values_manager.dart';
import 'package:yallah_chat/core/utils/widgets/defualt_app_bar.dart';
import 'package:yallah_chat/core/utils/widgets/my_textButton.dart';

class NewPostScreen extends StatelessWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: 'Create Post',
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s10),
            child: MyTextButton(
              onPressedTextButton: () {},
              text: 'Post',
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Column(
          children: [
            Row(
              children: const [
                CircleAvatar(
                  radius: AppSize.s25,
                  backgroundImage: NetworkImage(
                    'https://img.freepik.com/free-photo/happy-young-woman-enjoying-vacation_158595-4298.jpg?w=740&t=st=1669649577~exp=1669650177~hmac=4801a6bc4b4eb5f3a1c41977500d06b07fd65f5afe76c34d8eaaabfe6aa11b69',
                  ),
                ),
                SizedBox(
                  width: AppSize.s15,
                ),
                Expanded(
                  child: Text(
                    'Ali Fadhel Hassan',
                    style: TextStyle(height: 1.3),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'What is on your mind....',
                    border: InputBorder.none),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: (){},
                    child: Row(
                      children: const [
                        Icon(
                          IconBroken.Image,
                          color: ColorManager.blue,
                        ),
                        SizedBox(
                          width: AppSize.s5,
                        ),
                        Text(
                          'Add Photo',
                          style: TextStyle(
                            color: ColorManager.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: (){},
                    child: Row(
                      children: const [
                        Text(
                          '# Tags',
                          style: TextStyle(
                            color: ColorManager.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
