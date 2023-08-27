class AddFavouriteModel{

 late bool status;
 late String message;
 AddFavouriteModel.fromjson(Map<String,dynamic>json){
  status=json["status"];
  message=json["message"];
 }
}