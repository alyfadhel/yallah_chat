import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallah_chat/core/resources/color_manager.dart';
import 'package:yallah_chat/core/resources/icon_broken.dart';
import 'package:yallah_chat/core/resources/values_manager.dart';
import 'package:yallah_chat/core/utils/widgets/my_form_field.dart';
import 'package:yallah_chat/model/user_model.dart';
import 'package:yallah_chat/modules/home/cubit/cubit.dart';
import 'package:yallah_chat/modules/home/cubit/states.dart';

class ChatDetailsScreen extends StatelessWidget {
  final UserModel userModel;
  const ChatDetailsScreen({Key? key,required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
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
                buildMessage(),
                buildMyMessage(),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(.3),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(
                      AppSize.s20,
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: cubit.messageController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Type your message here ...'
                          ),
                        ),
                      ),
                      Container(
                        height: AppSize.s50,
                        color: ColorManager.blue,
                        child: MaterialButton(
                          onPressed: ()
                          {
                            cubit.sendMessage(
                                receiverId: userModel.uId,
                                text: cubit.messageController.text,
                                dateTime: DateTime.now().toString(),
                            );
                          },
                          minWidth: 1.0,
                          child: const Icon(
                            IconBroken.Send,
                            color: ColorManager.sWhite,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
Widget buildMessage()=>Align(
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
);
Widget buildMyMessage()=>Align(
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
);
