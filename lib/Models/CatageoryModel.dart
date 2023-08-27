class CategoryModel{

  late bool status;
  late CategoryDataModel data;
  CategoryModel.fromjson(Map<String,dynamic>json){
    status=json["status"];
    data=CategoryDataModel.fromjson(json["data"]);

  }
}

class CategoryDataModel{
 late int CurrentPage;

 List<CategoryDataDetails>data=[];
CategoryDataModel.fromjson(Map<String,dynamic>json){

  CurrentPage=json["current_page"];
  json["data"].forEach((e){
    data.add(CategoryDataDetails.fromjson(e));
  });
}
}

class CategoryDataDetails{
 late int id;
 late String name;
 late String image;

 CategoryDataDetails.fromjson(Map<String,dynamic>json){

   id=json["id"];
   name=json["name"];
   image=json["image"];
 }
}