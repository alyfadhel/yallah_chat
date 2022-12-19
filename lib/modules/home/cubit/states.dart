import 'package:yallah_chat/model/user_model.dart';

abstract class HomeStates{}

class InitialHomeState extends HomeStates{}

class GetHomeLoadingState extends HomeStates{}

class GetHomeSuccessState extends HomeStates {}

class GetHomeErrorState extends HomeStates
{
  final String error;

  GetHomeErrorState(this.error);
}

class GetAllUserLoadingState extends HomeStates{}

class GetAllUserSuccessState extends HomeStates {}

class GetAllUserErrorState extends HomeStates
{
  final String error;

  GetAllUserErrorState(this.error);
}

class GetPostsLoadingState extends HomeStates{}

class GetPostsSuccessState extends HomeStates {}

class GetPostsErrorState extends HomeStates
{
  final String error;

  GetPostsErrorState(this.error);
}


class GetLikePostsSuccessState extends HomeStates {}

class GetLikePostsErrorState extends HomeStates
{
  final String error;

  GetLikePostsErrorState(this.error);
}

class GetNumberLikePostsSuccessState extends HomeStates {}

class GetNumberLikePostsErrorState extends HomeStates
{
  final String error;

  GetNumberLikePostsErrorState(this.error);
}

class ChangeBottomNav extends HomeStates{}

class SocialNewPostState extends HomeStates{}

class SocialProfileImagePickedSuccessState extends HomeStates{}

class SocialProfileImagePickedErrorState extends HomeStates{}

class SocialCoverImagePickedSuccessState extends HomeStates{}

class SocialCoverImagePickedErrorState extends HomeStates{}

class SocialUploadProfileImageSuccessState extends HomeStates{}

class SocialUploadProfileImageErrorState extends HomeStates{}

class SocialUploadCoverImageSuccessState extends HomeStates{}

class SocialUploadCoverImageErrorState extends HomeStates{}

class SocialUserUpdateLoadingState extends HomeStates{}

class SocialUserUpdateErrorState extends HomeStates{}

//posts

class SocialCreatePostLoadingState extends HomeStates{}

class SocialCreatePostSuccessState extends HomeStates{}

class SocialCreatePostErrorState extends HomeStates{}

class SocialPostImagePickedSuccessState extends HomeStates{}

class SocialPostImagePickedErrorState extends HomeStates{}

class SocialUploadPostImageSuccessState extends HomeStates{}

class SocialUploadPostImageErrorState extends HomeStates{}

class SocialRemovePostImage extends HomeStates{}

class SocialRemovePostSuccessState extends HomeStates{}
class SocialRemovePostErrorState extends HomeStates
{
  final String error;

  SocialRemovePostErrorState(this.error);
}

// chat
class SocialSendMessageSuccessState extends HomeStates{}

class SocialSendMessageErrorState extends HomeStates
{
  final String error;

  SocialSendMessageErrorState(this.error);
}

class SocialGetMessageLoadingState extends HomeStates{}
class SocialGetMessageSuccessState extends HomeStates{}

