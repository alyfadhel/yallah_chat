import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallah_chat/core/resources/color_manager.dart';
import 'package:yallah_chat/core/resources/icon_broken.dart';
import 'package:yallah_chat/core/resources/values_manager.dart';
import 'package:yallah_chat/core/utils/widgets/defualt_app_bar.dart';
import 'package:yallah_chat/core/utils/widgets/my_textButton.dart';
import 'package:yallah_chat/modules/home/cubit/cubit.dart';
import 'package:yallah_chat/modules/home/cubit/states.dart';


final now = DateTime.now();
class NewPostScreen extends StatelessWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Create Post',
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.s10),
                child: MyTextButton(
                  onPressedTextButton: () {
                    if (cubit.postImage == null) {
                      cubit.createPost(
                        dateTime: now.toString(),
                        text: cubit.textController.text,
                      );
                    } else {
                      cubit.uploadPostImage(
                        dateTime: now.toString(),
                        text: cubit.textController.text,
                      );
                    }
                  },
                  text: 'Post',
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: SingleChildScrollView(
              child: SizedBox(
                height: 730,
                child: Column(
                  children: [
                    if(state is SocialCreatePostLoadingState)
                      const LinearProgressIndicator(),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    if(state is SocialCreatePostLoadingState)
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: AppSize.s25,
                          backgroundImage: NetworkImage(
                            cubit.userModel!.image,
                          ),
                        ),
                        const SizedBox(
                          width: AppSize.s15,
                        ),
                        const Expanded(
                          child: Text(
                            'Ali Fadhel Hassan',
                            style: TextStyle(height: 1.3),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: cubit.textController,
                        decoration: const InputDecoration(
                            hintText: 'What is on your mind....',
                            border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    if(cubit.postImage != null)
                      Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Container(
                            width: double.infinity,
                            height: AppSize.s500,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                AppSize.s5,
                              ),
                              image: DecorationImage(
                                image: FileImage(cubit.postImage!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              cubit.removePostImage();
                            },
                            icon: const CircleAvatar(
                              radius: AppSize.s20,
                              child: Icon(
                                Icons.close,
                                size: AppSize.s16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextButton(
                            onPressed: ()
                            {
                              cubit.getPostImage();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                        const Spacer(),
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
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
            ),
          ),
        );
      },
    );
  }
}
