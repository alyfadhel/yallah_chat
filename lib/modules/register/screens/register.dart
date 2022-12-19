import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallah_chat/core/resources/color_manager.dart';
import 'package:yallah_chat/core/resources/strings_manager.dart';
import 'package:yallah_chat/core/resources/values_manager.dart';
import 'package:yallah_chat/core/utils/constance/constance.dart';
import 'package:yallah_chat/core/utils/widgets/my_button.dart';
import 'package:yallah_chat/core/utils/widgets/my_form_field.dart';
import 'package:yallah_chat/core/utils/widgets/toast_state.dart';
import 'package:yallah_chat/modules/home/screens/home_layout.dart';
import 'package:yallah_chat/modules/login/screens/login.dart';
import 'package:yallah_chat/modules/register/cubit/cubit.dart';
import 'package:yallah_chat/modules/register/cubit/states.dart';

var nameController = TextEditingController();
var emailController = TextEditingController();
var phoneController = TextEditingController();
var passwordController = TextEditingController();
var formStateKey = GlobalKey<FormState>();

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (BuildContext context, state) {
          if (state is GetCreateSuccessState) {
            uId = state.uId;
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (route) => false);
          }
          if(state is GetRegisterErrorState){
            showToast(
                text: state.error,
                state: ToastState.error,
            );
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formStateKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.registerHere,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: ColorManager.sBlack),
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        Text(
                          AppStrings.registerTitle,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: ColorManager.grey),
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        MyFormField(
                          controller: nameController,
                          type: TextInputType.text,
                          label: 'name',
                          prefix: Icons.person_outline_outlined,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        MyFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          label: 'email address',
                          prefix: Icons.email_outlined,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        MyFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          label: 'phone',
                          prefix: Icons.phone_android_outlined,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your phone';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        MyFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          label: 'password',
                          prefix: Icons.lock_outline,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          isPassword: cubit.isPassword,
                          suffix: cubit.suffix,
                          onPressed: () {
                            cubit.changePasswordRegisterVisibility();
                          },
                          onFieldSubmitted: (String value) {
                            cubit.registerUser(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              password: passwordController.text,
                            );
                          },
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        ConditionalBuilder(
                          condition: state is! GetRegisterLoadingState,
                          builder: (context) => MyButton(
                            onPressedTextButton: () {
                              if (formStateKey.currentState!.validate()) {
                                cubit.registerUser(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            text: AppStrings.register,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: ColorManager.sWhite),
                          ),
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
