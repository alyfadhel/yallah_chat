abstract class LoginStates{}

class InitialLoginState extends LoginStates{}

class ChangeLoginPasswordVisibility extends LoginStates{}

class GetLoginLoadingState extends LoginStates{}

class GetLoginSuccessState extends LoginStates{
  final String uId;

  GetLoginSuccessState(this.uId);
}

class GetLoginErrorState extends LoginStates
{
  final String error;

  GetLoginErrorState(this.error);
}


