import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallah_chat/modules/login/cubit/states.dart';
import 'package:yallah_chat/modules/register/cubit/states.dart';

class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit(): super(InitialLoginState());

  static LoginCubit get(context)=>BlocProvider.of(context);

  bool isPassword = true;
  IconData suffix = Icons.visibility_off_outlined;

  void changePasswordLoginVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangeLoginPasswordVisibility());
  }

  void loginUser({
    required String email,
    required String password,
})async{
    emit(GetLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value)
    {
      print(value.user!.email);
      print(value.user!.uid);
      emit(GetLoginSuccessState(value.user!.uid));
    }).catchError((error)
    {
      emit(GetLoginErrorState(error.toString()));
    });
  }



}