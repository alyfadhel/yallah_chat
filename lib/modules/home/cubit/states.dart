abstract class HomeStates{}

class InitialHomeState extends HomeStates{}

class GetHomeLoadingState extends HomeStates{}

class GetHomeSuccessState extends HomeStates
{

}

class GetHomeErrorState extends HomeStates
{
  final String error;

  GetHomeErrorState(this.error);
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