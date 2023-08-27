class LoginModel {
  late bool status;
  late String message;
   UserData? data;
  LoginModel(this.status, this.message, this.data);
  LoginModel.JsonForm(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data =  json["data"]!=null? UserData.JsonForm(json["data"]) :null;
  }
}

class UserData {
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late int points;
  late int credit;
  late String token;

  UserData(this.id, this.name, this.email, this.phone, this.image, this.points,
      this.credit, this.token);

  UserData.JsonForm(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    image = json["image"];
    points = json["points"];
    credit = json["credit"];
    token = json["token"];
  }
}
