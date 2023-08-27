class HomeModel {
  late bool status;
  late HomeDataModel data;
  HomeModel.fromjson(Map<String, dynamic> json) {
    status = json["status"];
    data = HomeDataModel.fromjsom(json["data"]);
  }
}

class HomeDataModel {
   List<BannersModel> banners=[];
   List<ProductsModel> products=[];
  HomeDataModel.fromjsom(Map<String, dynamic> json) {
    json["banners"].forEach((element) {
      banners.add(BannersModel.fromjson(element));
    });
    json["products"].forEach((element) {
      products.add(ProductsModel.fromjson(element));
    });
  }
}

class BannersModel {
 late  int id;
  late String image;

  BannersModel.fromjson(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
  }
}

class ProductsModel {
  late dynamic id;
  late dynamic price;
  late dynamic oldPrice;
  late int discount;
  late String image;
  late String name;
  late bool inFavourite;
  late bool inCart;

  ProductsModel.fromjson(Map<String, dynamic> json) {
    id = json["id"];
    price = json["price"];
    oldPrice = json["old_price"];
    discount = json["discount"];
    image = json["image"];
    name = json["name"];
    inFavourite = json["in_favorites"];
    inCart = json["in_cart"];
  }
}
