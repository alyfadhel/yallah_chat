import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yallah_chat/core/resources/icon_broken.dart';
import 'package:yallah_chat/core/utils/constance/constance.dart';
import 'package:yallah_chat/model/post_model.dart';
import 'package:yallah_chat/model/yalla_chat_model.dart';
import 'package:yallah_chat/modules/home/cubit/states.dart';
import 'package:yallah_chat/modules/home/layout/chats/chats.dart';
import 'package:yallah_chat/modules/home/layout/feeds/feeds.dart';
import 'package:yallah_chat/modules/home/layout/post/post.dart';
import 'package:yallah_chat/modules/home/layout/settings/screen/settings.dart';
import 'package:yallah_chat/modules/home/layout/user/user.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(InitialHomeState());

  static HomeCubit get(context) => BlocProvider.of(context);

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var bioController = TextEditingController();
  var emailController = TextEditingController();

  YallahChat? userModel;

  void getUserData() async {
    emit(GetHomeLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print('Data : ${value.data()}');
      userModel = YallahChat.fromJson(value.data()!);
      emit(GetHomeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetHomeErrorState(error.toString()));
    });
  }

  int currentIndex = 0;

  List<BottomNavigationBarItem> items = [
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

  List<Widget> screens = [
    const FeedsScreen(),
    const ChatsScreen(),
    const NewPostScreen(),
    const UserScreen(),
    const SettingsScreen(),
  ];

  List<String> titles = [
    'Home',
    'Chats',
    'New Post',
    'User',
    'Settings',
  ];

  void changeBottomNav(int index) {
    if (index == 2) {
      emit(SocialNewPostState());
    } else {
      currentIndex = index;
      emit(ChangeBottomNav());
    }
  }

  // Get Profile Image

  File? profileImage;
  final picker = ImagePicker();

  Future getIProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(SocialProfileImagePickedErrorState());
    }
  }

  // Get Cover Image

  File? coverImage;

  Future getCoverImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(SocialCoverImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(SocialCoverImagePickedErrorState());
    }
  }

  // Upload Profile Image

  void uploadProfileImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());
    FirebaseStorage.instance
        .ref()
        .child(
          'users/${Uri.file(profileImage!.path).pathSegments.last}',
        )
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          image: value,
        );
        //emit(SocialUploadProfileImageSuccessState());
      }).catchError((error) {
        emit(SocialUploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(SocialUploadProfileImageErrorState());
    });
  }

  // Upload Cover Image

  void uploadCoverImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());
    FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          cover: value,
        );
        // emit(SocialUploadCoverImageSuccessState());
      }).catchError((error) {
        emit(SocialUploadCoverImageErrorState());
      });
    }).catchError((error) {
      emit(SocialUploadCoverImageErrorState());
    });
  }

  // Update User

  void updateUser({
    required String name,
    required String phone,
    required String bio,
    String? image,
    String? cover,
  }) {
    YallahChat model = YallahChat(
      name: name,
      email: userModel!.email,
      phone: phone,
      uId: userModel!.uId,
      cover: cover ?? userModel!.cover,
      image: image ?? userModel!.image,
      bio: bio,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(SocialUserUpdateErrorState());
    });
  }


  // Posts

  File? postImage;

  Future getPostImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(SocialPostImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(SocialPostImagePickedErrorState());
    }
  }

  void uploadPostImage({
    required String dateTime,
    required String text,
  }) {
    FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        createPost(
          dateTime: dateTime,
          text: text,
          postImage: value,
        );
        removePostImage();
      }).catchError((error) {
        emit(SocialUploadPostImageErrorState());
      });
    }).catchError((error) {
      emit(SocialUploadPostImageErrorState());
    });
  }

  var textController = TextEditingController();

  void createPost({
    required String dateTime,
    required String text,
    String? postImage,
  }) {
    emit(SocialCreatePostLoadingState());
    PostModel model = PostModel(
      name: userModel!.name,
      uId: userModel!.uId,
      image: userModel!.image,
      dateTime: dateTime,
      text: text,
      postImage: postImage ?? '',
    );
    FirebaseFirestore.instance
        .collection('posts')
        .add(model.topMap())
        .then((value) {
      textController.clear();
      getPosts();
      //emit(SocialCreatePostSuccessState());
    }).catchError((error) {
      emit(SocialCreatePostErrorState());
    });
  }

  void removePostImage() {
    postImage = null;
    emit(SocialRemovePostImage());
  }

  List<PostModel> post = [];
  List<String> postId = [];
  List<int> likes = [];

  void getPosts() {
    post = [];
    emit(GetPostsLoadingState());
    FirebaseFirestore.instance
        .collection('posts')
        .orderBy('dateTime')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        element.reference
            .collection('likes')
            .get()
            .then((value)
        {
          likes.add(value.docs.length);
          postId.add(element.id);
          post.add(PostModel.fromJson(element.data()));
          emit(GetNumberLikePostsSuccessState());
        })
            .catchError((error)
        {
          print(error.toString());
          emit(GetNumberLikePostsErrorState(error.toString()));
        });
      });
      emit(GetPostsSuccessState());
    }).catchError((error) {
      emit(GetPostsErrorState(error.toString()));
    });
  }

  void likePost(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(userModel!.uId)
        .set({
      'like': true,
    }).then((value) {
      emit(GetLikePostsSuccessState());
    }).catchError((error) {
      emit(GetLikePostsErrorState(error.toString()));
    });
  }


  PostModel? postModel;

  void deletePost(String postId)
  {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .delete()
        .then((value)
    {
      getPosts();
      //emit(SocialRemovePostSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(SocialRemovePostErrorState(error.toString()));
    });
  }





}
