import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_example/getx/routes/routes.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: Container(
        child: GridView.count(
          padding: EdgeInsets.all(16.0),
          childAspectRatio: 2.0,
          crossAxisCount: 1,
          children: [
          Card(
            elevation: 10.0,
            borderOnForeground: true,
            shadowColor: Colors.amberAccent,
            semanticContainer: true,
            color: Colors.amberAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Title',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold)),
                Text('Desc',style: TextStyle(fontSize: 16.0)),
              ],
            ),
          ),
          Card(
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Title',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold)),
                Text('Desc',style: TextStyle(fontSize: 16.0)),
              ],
            ),
          ),
          Card(
            color: Colors.blueAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Title',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold)),
                Text('Desc',style: TextStyle(fontSize: 16.0)),
              ],
            ),
          )
        ],),
      ),
    );
  }
}
