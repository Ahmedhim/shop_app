import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/Api/Api.dart';
import 'package:shop_app/Api/SharedPrefference.dart';
import 'package:shop_app/Cubits/ShopCubit/ShopCubitState.dart';
import 'package:shop_app/Models/AddFavouriteModel.dart';
import 'package:shop_app/Models/GetFavouriteModel.dart';
import 'package:shop_app/Models/HomeModel.dart';
import 'package:shop_app/Models/ProfileModel.dart';
import 'package:shop_app/Models/SearchModel.dart';
import 'package:shop_app/views/CatageoryScreen.dart';
import 'package:shop_app/views/FavouriteScreen.dart';
import 'package:shop_app/views/ProductScreen.dart';
import 'package:shop_app/views/SettingsScreen.dart';

import '../../Models/CatageoryModel.dart';

class ShopCubit extends Cubit<ShopCubitState> {
  ShopCubit() : super(ShopIntialState());

  int currentIndex = 0;
  List<Widget> bottomScreens = [
    const ProductScreen(),
    const CatageoryScreen(),
    const FavouriteScreen(),
    const SettingScreen()
  ];

  void ChangeBottom(int index) {
    currentIndex = index;

    emit(ShopChangeNavigtor());
  }

  HomeModel? homeModel;
  Map<int, bool> favourites = {};

  void GetHomeData() async {
    emit(ShopLoadingState());

    await Api()
        .GetData(
            url: "https://student.valuxapps.com/api/home",
            token: Preference.getData(key: "token"))
        .then((value) {
      homeModel = HomeModel.fromjson(value);
      homeModel!.data.products.forEach((element) {
        favourites.addAll({element.id: element.inFavourite});
      });
      emit(ShopSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopFaliureState(error.toString()));
    });
  }

  CategoryModel? model;
  void GetCatageory() async {
    await Api()
        .GetData(
            url: "https://student.valuxapps.com/api/categories",
            token: Preference.getData(key: "token"))
        .then((value) {
      model = CategoryModel.fromjson(value);
      emit(ShopGetCatageorySuccess());
    }).catchError((error) {
      print(error.toString());
      emit(ShopGetCatageoryFaliure());
    });
  }

  AddFavouriteModel? addFavouriteModel;
  void AddFavourite(
    dynamic Product_id,
  ) async {
    favourites[Product_id] = !favourites[Product_id]!;
    emit(ShopSuccessIsliked());
    await Api().postData(
        token: Preference.getData(key: "token"),
        url: "https://student.valuxapps.com/api/favorites",
        body: {
          "product_id": Product_id.toString(),
        }).then((value) {
      addFavouriteModel = AddFavouriteModel.fromjson(value);
      if (addFavouriteModel!.status) {
        print(addFavouriteModel!.status.toString());
        Fluttertoast.showToast(
          msg: addFavouriteModel!.message.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        emit(ShopSuccessIsliked());
      } else {
        favourites[Product_id] = !favourites[Product_id]!;
        Fluttertoast.showToast(
          msg: addFavouriteModel!.message.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        emit(ShopSuccessIsliked());
      }
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorIsliked());
    });
  }

  GetFavouriteModel? getFavouriteModel;
  void GetFavourite() async {
    emit(ShopGetFavouriteLoading());
    await Api()
        .GetData(
            url: "https://student.valuxapps.com/api/favorites",
            token: Preference.getData(key: "token"))
        .then((value) {
      getFavouriteModel = GetFavouriteModel.fromJson(value);
      emit(ShopGetFavouriteSucces());
    }).catchError((error) {
      print(error.toString());
      emit(ShopGetFavouriteError());
    });
  }
ProfileModel? profileModel;
  void GetProfile() async{
   await Api().GetData(
        url: "https://student.valuxapps.com/api/profile",
        token: Preference.getData(key: "token")).then((value) {
          profileModel=ProfileModel.fromJson(value);
          emit(ShopGetProfileSuccess());
    }).catchError((error){
      print(error.toString());
      emit(ShopGetProfileError());
    });
  }

  @override
  void onChange(Change<ShopCubitState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
