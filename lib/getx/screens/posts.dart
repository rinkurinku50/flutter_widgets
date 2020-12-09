import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PostsPage'),
      ),
      body: Center(
           child: MaterialButton(onPressed:  () {
             Get.back();
           },child: Text('back')),   
      ),
    );
  }
}
