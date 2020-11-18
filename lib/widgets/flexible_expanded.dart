import 'package:flutter/material.dart';

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flexible"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              fit: FlexFit.loose,
              flex: 1,
              child: Container(
                height: 150,
                color: Colors.red,
                child: Text(''),
              )),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
                child: Text(''),
              ))
        ],
      ),
    );
  }
}
