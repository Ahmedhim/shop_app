import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/Api/Api.dart';
import 'package:shop_app/Api/SharedPrefference.dart';
import 'package:shop_app/Cubits/LoginCubit/LoginCubitState.dart';
import 'package:shop_app/Models/LoginModel.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit() : super(intialLoginState());
  late LoginModel loginModel;
  void UserLogin({required String email, required String password}) async {
    emit(LoadingLoginState());
    try {
      await Api().postData(
        url: "https://student.valuxapps.com/api/login",
        body: {"email": email, "password": password},
      ).then((value)async {
        loginModel = LoginModel.JsonForm(value);
       await Preference.saveData(key: "token", value:loginModel.data!.token);
      });

      if (loginModel.status.toString() == "true") {
        Fluttertoast.showToast(
          msg: loginModel.message.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        emit(SuccessLoginState());
      } else {
        Fluttertoast.showToast(
          msg: loginModel.message.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        emit(FailureLoginState(loginModel.message.toString()));
      }
    } catch (e) {
      emit(FailureLoginState(e.toString()));
    }
  }


  @override
  void onChange(Change<LoginCubitState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
