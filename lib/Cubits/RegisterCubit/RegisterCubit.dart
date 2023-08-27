import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/Api/Api.dart';
import 'package:shop_app/Cubits/RegisterCubit/RegisterCubitState.dart';
import 'package:http/http.dart' as http;

class RegisterCubit extends Cubit<RegisterCubitState> {
  RegisterCubit() : super(intiaRegisterState());

  void userRegister(
      {required String email,
      required String password,
      required String name,
      required String Phone}) async {
    emit(LoadingRegisterState());
    try {
      var status;
      var message;
      await Api()
          .postData(url: "https://student.valuxapps.com/api/register", body: {
        "email": email,
        "password": password,
        "name": name,
        "phone": Phone,
      }).then((value) {
        message = value["message"].toString();
        status = value["status"].toString();
      });
      if (status == "true") {
        Fluttertoast.showToast(
          msg: message.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        emit(SuccessRegisterState());
      } else {
        Fluttertoast.showToast(
          msg: message.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        emit(FailureRegisterState("error with create account"));
      }
    } catch (e) {
      emit(FailureRegisterState(e.toString()));
    }
  }

  Future<dynamic> postData(
      {required String url, required Map<String, dynamic> body}) async {
    http.Response response = await http.post(Uri.parse(url), body: body);
    print(jsonDecode(response.body));
  }
}
