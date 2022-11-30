import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallah_chat/core/resources/icon_broken.dart';
import 'package:yallah_chat/core/resources/values_manager.dart';
import 'package:yallah_chat/core/utils/widgets/defualt_app_bar.dart';
import 'package:yallah_chat/core/utils/widgets/my_form_field.dart';
import 'package:yallah_chat/core/utils/widgets/my_textButton.dart';
import 'package:yallah_chat/modules/home/cubit/cubit.dart';
import 'package:yallah_chat/modules/home/cubit/states.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var model = HomeCubit.get(context).userModel!;
        var cubit = HomeCubit.get(context);
        cubit.nameController.text = model.name;
        cubit.bioController.text = model.bio;
        cubit.phoneController.text = model.phone;
        return  Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Edit Profile',
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.s10
                ),
                child: MyTextButton(
                  onPressedTextButton: () {},
                  text: 'Update',
                  isUpperCase: false,
                ),
              ),
            ],
          ),
          body:Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Column(
              children: [
                SizedBox(
                  height: 310,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
                              width: double.infinity,
                              height: AppSize.s250,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  AppSize.s5,
                                ),
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    'https://img.freepik.com/premium-photo/young-beautiful-cute-sweet-lovely-smiling-woman-with-hold-bouquet-white-fresh-flowers-white-wall-background_158595-8178.jpg?w=900',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: const CircleAvatar(
                                radius: AppSize.s20,
                                child:  Icon(
                                  IconBroken.Camera,
                                  size: AppSize.s16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: AppSize.s65,
                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                            child: const CircleAvatar(
                              radius: AppSize.s60,
                              backgroundImage: NetworkImage(
                                  'https://img.freepik.com/free-photo/happy-young-woman-enjoying-vacation_158595-4298.jpg?w=740&t=st=1669649577~exp=1669650177~hmac=4801a6bc4b4eb5f3a1c41977500d06b07fd65f5afe76c34d8eaaabfe6aa11b69'
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: (){},
                            icon: const CircleAvatar(
                              radius: AppSize.s20,
                              child:  Icon(
                                IconBroken.Camera,
                                size: AppSize.s16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: AppSize.s40,
                ),
                MyFormField(
                  controller: cubit.nameController,
                  type: TextInputType.name,
                  label: 'name',
                  prefix: IconBroken.User,
                  validator: (value)
                  {
                    if(value!.isEmpty){
                      return'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                MyFormField(
                  controller: cubit.bioController,
                  type: TextInputType.text,
                  label: 'bio',
                  prefix: IconBroken.Info_Circle,
                  validator: (value)
                  {
                    if(value!.isEmpty){
                      return'Please enter your bio';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                MyFormField(
                  controller: cubit.phoneController,
                  type: TextInputType.phone,
                  label: 'phone',
                  prefix: IconBroken.Call,
                  validator: (value)
                  {
                    if(value!.isEmpty){
                      return'Please enter your phone';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}
