import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Cubits/SearchCubit/SearchCubitState.dart';

import '../../Api/Api.dart';
import '../../Api/SharedPrefference.dart';
import '../../Models/SearchModel.dart';

class SearchCubit extends Cubit<SearchState>{

  SearchCubit():super(SearchInitialState());

  SearchModel? searchModel;
  void Search({required String productName}){
    emit(SearchLoadingState());
    Api().postData(url: "https://student.valuxapps.com/api/products/search", body: {
      "text":productName
    },token:Preference.getData(key:"token")).then((value) {
      searchModel=SearchModel.fromJson(value);
      emit(SearchSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(SearchErrorState());
    });
  }
@override
  void onChange(Change<SearchState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}