import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallah_chat/core/resources/icon_broken.dart';
import 'package:yallah_chat/core/resources/values_manager.dart';
import 'package:yallah_chat/modules/home/cubit/cubit.dart';
import 'package:yallah_chat/modules/home/cubit/states.dart';
import 'package:yallah_chat/modules/home/layout/settings/screen/edit_profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var model = HomeCubit.get(context).userModel!;
        return Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 310,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Container(
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
                      ),
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
                    ],
                  ),

                ),
                const SizedBox(
                  height: AppSize.s10,
                ),
                Text(
                  model.name,
                ),
                const SizedBox(
                  height: AppSize.s5,
                ),
                Text(
                  model.bio,
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(
                  height: AppSize.s40,
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: (){},
                        child: const Text(
                          'Add Photos',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: AppSize.s10,
                    ),
                    OutlinedButton(
                      onPressed: ()
                      {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => const EditProfileScreen(),));
                      },
                      child: const Icon(
                        IconBroken.Edit,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
