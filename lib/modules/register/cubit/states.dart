abstract class RegisterStates{}

class InitialRegisterState extends RegisterStates{}

class ChangePasswordVisibility extends RegisterStates{}

class GetRegisterLoadingState extends RegisterStates{}

class GetRegisterSuccessState extends RegisterStates{}

class GetRegisterErrorState extends RegisterStates
{
  final String error;

  GetRegisterErrorState(this.error);
}

class GetCreateSuccessState extends RegisterStates
{
  final String uId;

  GetCreateSuccessState(this.uId);
}

class GetCreateErrorState extends RegisterStates
{
  final String error;

  GetCreateErrorState(this.error);
}

