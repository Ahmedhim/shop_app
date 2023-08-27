abstract class RegisterCubitState{}

class intiaRegisterState extends RegisterCubitState{}
class LoadingRegisterState extends RegisterCubitState{}
class SuccessRegisterState extends RegisterCubitState{}
class FailureRegisterState extends RegisterCubitState{
  final String error;
  FailureRegisterState(this.error);

}