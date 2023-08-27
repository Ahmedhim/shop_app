import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> postData({required String url,required Map<String,dynamic>body,String? token})async{

    http.Response response= await http.post(Uri.parse(url),body: body,headers: {
      "Authorization":token??"",
      "lang":"en"

    },);
    return jsonDecode(response.body);

  }

  Future<dynamic>GetData({required String url, String? token})async{

  http.Response response = await http.get(Uri.parse(url),headers: {
    "Authorization":token??"",
    "lang":"en"
    },);
  if(response.statusCode==200){
  return  jsonDecode(response.body);}
  else{
    throw Exception("There is a problem with getting data");
  }

  }
}
