
class ProfileModel{

 late bool status;
late Data data;
ProfileModel.fromJson(Map<String,dynamic>json){

  status=json["status"];
  data=Data.fromJson(json["data"]);
}
}

class Data{

 late int id;
 late String name;
 late String email;
 late String phone;
 late String image;
 late int Points;
 late int credit;
 late String token;
 Data.fromJson(Map<String,dynamic>json){

   id=json["id"];
   name=json["name"];
   email=json["email"];
   phone=json["phone"];
   image=json["image"];
   Points=json["points"];
   credit=json["credit"];
   token=json["token"];
 }
}