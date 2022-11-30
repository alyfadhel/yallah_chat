import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yallah_chat/model/yalla_chat_model.dart';
import 'package:yallah_chat/modules/register/cubit/states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(InitialRegisterState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData suffix = Icons.visibility_off_outlined;

  void changePasswordRegisterVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangePasswordVisibility());
  }

  void registerUser({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(GetRegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      createUser(
        name: name,
        email: email,
        phone: phone,
        uId: value.user!.uid,
      );
    }).catchError((error) {
      emit(GetRegisterErrorState(error.toString()));
    });
  }

  void createUser({
    required String name,
    required String email,
    required String phone,
    required String uId,
  }) async {
    YallahChat model = YallahChat(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      cover: 'https://img.freepik.com/free-photo/girl-with-two-red-haired-braids-charming-toothy-smile-used-red-lipstick-dressed-stripped-t-shirt-isolated_295783-2169.jpg?w=740&t=st=1669713977~exp=1669714577~hmac=be2a96efe7867989e081f29e4f65e5891363881fd8ab24d82fd033fd1130c491',
      image: 'https://img.freepik.com/free-photo/bohemian-man-with-his-arms-crossed_1368-3542.jpg?w=826&t=st=1669708966~exp=1669709566~hmac=74456f1cd054400ff1d4a35fd0e68508832c79720a8b02f0d77a516a957a1bc0',
      bio: 'write your bio....',
      isEmailVerified: false,
    );
      FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .set(model.toMap())
          .then((value) {
        emit(GetCreateSuccessState(uId));
      }).catchError((error) {
        emit(GetCreateErrorState(error.toString()));
      });
    }
  }

