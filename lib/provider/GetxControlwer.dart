// import 'package:api/helper/api.dart';
// import 'package:flutter/cupertino.dart';
//
// import '../model/pixa_model.dart';
// import '../view/home_screen.dart';
//
// class HomeProvider extends ChangeNotifier{
//   Pixa? pixa;
//   Future<void> fetchPhotos(String search) async {
//     Map json=await ApiHelper.apiHelper.fetchApiData(search);
//    pixa=Pixa.fromJson(json);
//    notifyListeners();
//
//
//   }
//   HomeProvider(){
//     fetchPhotos(search);
//   }
// }



import 'package:api/helper/api.dart';
import 'package:api/model/pixa_model.dart';
import 'package:get/get.dart';

class ApiControler extends GetxController{
  var isLoding = true.obs;
  var userList=<userModel>[].obs;
  RxBool istrue=true.obs;

  void togal(){
    if(istrue==true){
      istrue=false.obs;
      print("Clicke---------------------------");

    }
    else{
      istrue=true.obs;
      print("Clicke 2 ---------------------------");
    }

  }
  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchData();
  }

  final ApiHelper apiHelper = ApiHelper();
  Future<void> fetchData() async {

    List user=await ApiHelper().fetchApiData();
    print(user);
    print("Data--------------------------------");
    if(user!=null){
      userList.value = user.map((e) => userModel.fromJson(e),).toList();
      isLoding(false);
    }

  }


}