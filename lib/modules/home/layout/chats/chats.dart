import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallah_chat/core/resources/color_manager.dart';
import 'package:yallah_chat/core/resources/values_manager.dart';
import 'package:yallah_chat/model/user_model.dart';
import 'package:yallah_chat/modules/home/cubit/cubit.dart';
import 'package:yallah_chat/modules/home/cubit/states.dart';
import 'package:yallah_chat/modules/home/layout/chat_details/chat_details.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        if(cubit.users.isNotEmpty){
          return ConditionalBuilder(
            condition: cubit.users.isNotEmpty,
            builder: (context) => ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildChatItem(
                  cubit.users[index],
                  context,
              ),
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSize.s20),
                child: Divider(
                  height: AppSize.s1,
                  color: ColorManager.grey,
                ),
              ),
              itemCount: cubit.users.length,
            ),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No Users Currently',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.grey[400]
                  ),
                ),
                 Icon(
                  Icons.menu,
                  size: 100.0,
                   color: Colors.grey[400],
                ),
              ],
            ),
          );
      },
    );
  }
}

Widget buildChatItem(UserModel model,context) => InkWell(
  onTap: ()
  {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatDetailsScreen(
          userModel: model,
        ),
      ),
    );
  },
  child: Padding(
    padding: const EdgeInsets.all(AppPadding.p20),
    child: Row(
      children: [
        CircleAvatar(
          radius: AppSize.s25,
          backgroundImage: NetworkImage(
            model.image,
          ),
        ),
        const SizedBox(
          width: AppSize.s15,
        ),
        Text(
          model.name,
          style: const TextStyle(
            height: 1.3,
          ),
        ),
      ],
    ),
  ),
);
