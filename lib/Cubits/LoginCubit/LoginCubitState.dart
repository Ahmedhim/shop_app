abstract class LoginCubitState{}

class intialLoginState extends LoginCubitState{}
class LoadingLoginState extends LoginCubitState{}
class SuccessLoginState extends LoginCubitState{}
class FailureLoginState extends LoginCubitState{

  final String error;

  FailureLoginState(this.error);

}