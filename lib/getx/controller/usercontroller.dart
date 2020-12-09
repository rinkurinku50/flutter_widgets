import 'package:flutter/material.dart';
import 'package:flutter_widget_example/getx/model/model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var userData= List<User>().obs;
  var scstate=GlobalKey<ScaffoldState>().obs;
   @override
   void onInit() {
     super.onInit();
    allUser();
   }

    allUser() async {
     await Future.delayed(Duration(seconds: 1));
     var temData =[User(id: 1,name: "rinku",email: 'rinkurinku50@gmail.com'),
     User(id: 2,name: "rinku2",email: 'rinkurinku50@gmail.com'),
     User(id: 3,name: "rink3",email: 'rinkurinku50@gmail.com'),
     User(id: 4,name: "rink4",email: 'rinkurinku50@gmail.com'),
     User(id: 5,name: "rink5",email: 'rinkurinku50@gmail.com'),];

   userData.assignAll(temData);

  }

  addUser(User user) async {
     User use=user;
     userData.add(use);
     update();
  }

  deleteUser(var index) {
     var ind=index;
     userData.removeAt(ind);
     update();
  }
}