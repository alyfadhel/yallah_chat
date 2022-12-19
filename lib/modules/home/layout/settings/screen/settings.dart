import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallah_chat/core/resources/color_manager.dart';
import 'package:yallah_chat/core/resources/icon_broken.dart';
import 'package:yallah_chat/core/resources/values_manager.dart';
import 'package:yallah_chat/core/utils/network/local.dart';
import 'package:yallah_chat/core/utils/widgets/my_button.dart';
import 'package:yallah_chat/modules/home/cubit/cubit.dart';
import 'package:yallah_chat/modules/home/cubit/states.dart';
import 'package:yallah_chat/modules/home/layout/settings/screen/edit_profile.dart';
import 'package:yallah_chat/modules/login/screens/login.dart';

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
                            image: DecorationImage(
                              image: NetworkImage(
                                model.cover,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: AppSize.s65,
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        child:  CircleAvatar(
                          radius: AppSize.s60,
                          backgroundImage: NetworkImage(
                              model.image
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
                const SizedBox(
                  height: AppSize.s20,
                ),
                MyButton(
                  radius: 10,
                    onPressedTextButton: ()
                    {
                      CacheHelper.signOut(key: 'uId')
                          .then((value)
                      {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      });
                    },
                    text: 'LogOut',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.sWhite
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
