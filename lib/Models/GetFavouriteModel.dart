

class GetFavouriteModel{

 late bool status;
 late Data data;
 GetFavouriteModel.fromJson(Map<String,dynamic>json){
   status=json["status"];
   data=Data.fromJson(json["data"]);
 }
}


class Data{

  late int current_page;
  List<ItemData>data=[];
  Data.fromJson(Map<String,dynamic>json){

    current_page=json["current_page"];
    json["data"].forEach((e){
      data.add(ItemData.frromJson(e));
    });
  }
}

class ItemData{

 late int id;
late Product product;
ItemData.frromJson(Map<String,dynamic>json){

  id=json["id"];
  product=Product.fromJson(json["product"]);
}
}

class Product{

 late int id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
 late String image;
 late String name;
 late String description;
  Product.fromJson(Map<String,dynamic>json){

    id=json["id"];
    price=json["price"];
    oldPrice=json["old_price"];
    discount=json["discount"];
    image=json["image"];
    name=json["name"];
    description=json["description"];

  }
}