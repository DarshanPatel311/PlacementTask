// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
//
//
// class ApiHelper{
//   ApiHelper._();
//   static ApiHelper apiHelper=ApiHelper._();
//
//   Future<Map> fetchApiData(String search) async {
//     final String api="https://pixabay.com/api/?key=36643208-07b3c983a397efc05417416a0&q=car";
//
//     Uri uri=Uri.parse(api);
//
//    http.get(uri);
//    Response response =await http.get(uri);
//    if(response.statusCode==200){
//      String data=response.body;
//      Map json=jsonDecode(data);
//      return json;
//    }
//    return{};
//   }
//
//
// }
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class ApiHelper{


  fetchApiData() async {
    final String api="https://jsonplaceholder.typicode.com/todos";
    Uri uri=Uri.parse(api);

    Response response=await http.get(uri);
    if(response.statusCode==200){
      String data=response.body;
      print("Api Calling-------------------------");

      List json=jsonDecode(data);
      return json;
    }
    return {
      print("Api Not Calling--------------------------------------------")

    };
  }

}