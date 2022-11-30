import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yallah_chat/core/resources/icon_broken.dart';
import 'package:yallah_chat/core/utils/constance/constance.dart';
import 'package:yallah_chat/model/yalla_chat_model.dart';
import 'package:yallah_chat/modules/home/cubit/states.dart';
import 'package:yallah_chat/modules/home/layout/chats/chats.dart';
import 'package:yallah_chat/modules/home/layout/feeds/feeds.dart';
import 'package:yallah_chat/modules/home/layout/post/post.dart';
import 'package:yallah_chat/modules/home/layout/settings/screen/settings.dart';
import 'package:yallah_chat/modules/home/layout/user/user.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HomeCubit extends Cubit<HomeStates>
{
  HomeCubit(): super(InitialHomeState());

  static HomeCubit get(context)=>BlocProvider.of(context);

  var nameController  = TextEditingController();
  var phoneController = TextEditingController();
  var bioController   = TextEditingController();
  var emailController   = TextEditingController();

  YallahChat? userModel;
  void getUserData()async
  {
    emit(GetHomeLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get().then((value)
    {

    print('Data : ${value.data()}');
    userModel = YallahChat.fromJson(value.data()!);
     emit(GetHomeSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(GetHomeErrorState(error.toString()));
    });
  }

  int currentIndex = 0;

  List<BottomNavigationBarItem>items =
  [
    const BottomNavigationBarItem(
        icon: Icon(
            IconBroken.Home,
        ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
        icon: Icon(
            IconBroken.Chat,
        ),
      label: 'Chat',
    ),
    const BottomNavigationBarItem(
        icon: Icon(
            IconBroken.Paper_Upload,
        ),
      label: 'Post',
    ),
    const BottomNavigationBarItem(
        icon: Icon(
            IconBroken.User,
        ),
      label: 'User',
    ),
    const BottomNavigationBarItem(
        icon: Icon(
            IconBroken.Setting,
        ),
      label: 'Settings',
    ),
  ];

  List<Widget>screens = [
    const FeedsScreen(),
    const ChatsScreen(),
    const NewPostScreen(),
    const UserScreen(),
    const SettingsScreen(),
  ];

  List<String>titles =
  [
    'Home',
    'Chats',
    'New Post',
    'User',
    'Settings',
  ];

  void changeBottomNav(int index)
  {
    if(index == 2) {
      emit(SocialNewPostState());
    } else {
      currentIndex = index;
      emit(ChangeBottomNav());
    }

  }

  /////////////////////////////////////////////////////////////////

  File? image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(SocialProfileImagePickedErrorState());
    }
  }

  ////////////////////////////////////////////////////////////////

  File? cover;
  Future getCover() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      cover = File(pickedFile.path);
      emit(SocialCoverImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(SocialCoverImagePickedErrorState());
    }
  }





}