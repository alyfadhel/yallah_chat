import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallah_chat/core/resources/color_manager.dart';
import 'package:yallah_chat/core/resources/icon_broken.dart';
import 'package:yallah_chat/core/resources/values_manager.dart';
import 'package:yallah_chat/model/post_model.dart';
import 'package:yallah_chat/modules/home/cubit/cubit.dart';
import 'package:yallah_chat/modules/home/cubit/states.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return ConditionalBuilder(
            condition: cubit.post.isNotEmpty,
            builder: (context) => SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: AppSize.s8,
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: AppSize.s5,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        const Image(
                          image: NetworkImage(
                            'https://img.freepik.com/free-photo/happy-stylish-man-casual-clothes-standing-cliff-mountain_158538-13995.jpg?w=900&t=st=1669645576~exp=1669646176~hmac=66ef74847bd76604b02e0d9774b4dff86e999ae204b8f79e6fc6cf73462b86d5',
                          ),
                          width: double.infinity,
                          height: AppSize.s250,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(AppPadding.p8),
                          child: Text(
                            'Communicate With Friends',
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: ColorManager.sWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => buildPostItem(cubit.post[index],context,index),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: AppSize.s10,
                    ),
                    itemCount: cubit.post.length,
                  ),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                ],
              ),
            ),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
        );
      },
    );
  }
}
Widget buildPostItem(PostModel model,context,index)=>Card(
  clipBehavior: Clip.antiAliasWithSaveLayer,
  margin: const EdgeInsets.symmetric(horizontal: AppSize.s8),
  elevation: AppSize.s5,
  child: Padding(
    padding: const EdgeInsets.all(AppPadding.p10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children:  [
                      Text(
                        model.name,
                        style: const TextStyle(height: 1.3),
                      ),
                      const Icon(
                        Icons.verified,
                        color: ColorManager.blue,
                        size: AppSize.s14,
                      ),
                    ],
                  ),
                  Text(
                    model.dateTime,
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(
                        color: ColorManager.grey,
                        fontSize: AppSize.s12,
                        height: 1.3),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: AppSize.s15,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz,
                size: AppSize.s16,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
              vertical: AppSize.s15
          ),
          child: Divider(
            height: AppSize.s1,
            color: ColorManager.grey,
          ),
        ),
         Text(
          model.text,
        ),
        // Padding(
        //   padding: const EdgeInsets.only(
        //       top: AppSize.s5,
        //       bottom: AppSize.s10
        //   ),
        //   child: SizedBox(
        //     width: double.infinity,
        //     child: Wrap(
        //       children: [
        //         Padding(
        //           padding: const EdgeInsetsDirectional.only(
        //               end: AppSize.s8
        //           ),
        //           child: SizedBox(
        //             height: AppSize.s25,
        //             child: MaterialButton(
        //               padding: EdgeInsets.zero,
        //               onPressed: (){},
        //               minWidth: AppSize.s1,
        //               child:  Text(
        //                 '#software',
        //                 style: Theme.of(context).textTheme.caption!.copyWith(
        //                     color: ColorManager.blue
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsetsDirectional.only(
        //               end: AppSize.s8
        //           ),
        //           child: SizedBox(
        //             height: AppSize.s25,
        //             child: MaterialButton(
        //               padding: EdgeInsets.zero,
        //               onPressed: (){},
        //               minWidth: AppSize.s1,
        //               child:  Text(
        //                 '#flutter',
        //                 style: Theme.of(context).textTheme.caption!.copyWith(
        //                     color: ColorManager.blue
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        if(model.postImage !='')
        Padding(
          padding: const EdgeInsetsDirectional.only(
            top: AppSize.s15
          ),
          child: Container(
            width: double.infinity,
            height: AppSize.s250,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(
                AppSize.s5,
              ),
              image:  DecorationImage(
                image: NetworkImage(
                  model.postImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppSize.s10,
          ),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSize.s5,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          IconBroken.Heart,
                          size: AppSize.s16,
                          color: ColorManager.red,
                        ),
                        const SizedBox(
                          width: AppSize.s5,
                        ),
                        Text(
                          '0',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  onTap: (){},
                ),
              ),
              Expanded(
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSize.s5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          IconBroken.Chat,
                          size: AppSize.s16,
                          color: ColorManager.amber,
                        ),
                        const SizedBox(
                          width: AppSize.s5,
                        ),
                        Text(
                          '0 comments',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  onTap: (){},
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
              bottom: AppSize.s10
          ),
          child: Divider(
            height: AppSize.s1,
            color: ColorManager.grey,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                child: Row(
                  children: [
                     CircleAvatar(
                      radius: AppSize.s20,
                      backgroundImage: NetworkImage(
                        HomeCubit.get(context).userModel!.image,
                      ),
                    ),
                    const SizedBox(
                      width: AppSize.s15,
                    ),
                    Text(
                      'Write a comment',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(
                          color: ColorManager.grey,
                          fontSize: AppSize.s12,
                          height: 1.3),
                    ),
                  ],
                ),
                onTap: (){},
              ),
            ),
            InkWell(
              child: Row(
                children: [
                  const Icon(
                    IconBroken.Heart,
                    size: AppSize.s16,
                    color: ColorManager.red,
                  ),
                  const SizedBox(
                    width: AppSize.s5,
                  ),
                  Text(
                    'Like',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
              onTap: ()
              {
                HomeCubit.get(context).likePost(HomeCubit.get(context).postId[index]);
              },
            ),
          ],
        ),

      ],
    ),
  ),
);
