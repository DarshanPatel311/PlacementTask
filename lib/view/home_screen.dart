import 'package:api/provider/GetxControlwer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
bool istrue=true;
class HomeScreen extends StatelessWidget {
  final ApiControler apiControler = Get.put(ApiControler());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User Data"),
          leading:  IconButton(onPressed: () {

                  apiControler.togal();




              }, icon: Icon(Icons.grid_view_rounded)),


        ),
        body: Obx(() {
          if (apiControler.isLoding.value) {
            return Center(child: CircularProgressIndicator());
          }
          return (apiControler.istrue.value)?ListView.builder(shrinkWrap: true,itemBuilder:(context,index)=>Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: (apiControler.userList[index].completed==true)?Colors.grey:Colors.black,width: 3)

              ),
              child: Column(
                children: [

                  Text("${apiControler.userList[index].title}"),
                  Text("${apiControler.userList[index].completed}"),
                ],
              ),
            ),
          ) ,itemCount: apiControler.userList.length,):GridView.builder(
              itemCount: apiControler.userList.length,
              itemBuilder: (context,index)=>Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color:(apiControler.userList[index].completed==true)?Colors.grey:Colors.black,width: 3 )

                  ),
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${apiControler.userList[index].title}"),
                      Text("${apiControler.userList[index].completed}"),
                    ],
                  ),
                ),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,


          ));
        }));
  }
}

// ListView.builder(
// itemCount: apiControler.userList.length,
// itemBuilder: (context, index) {
// return Text(apiControler.userList[index].id.toString());
// });